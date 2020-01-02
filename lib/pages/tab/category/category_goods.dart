import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/bean/CategoryGoodsBean.dart';
import 'package:flutter_shop/generated/i18n.dart';
import 'package:flutter_shop/pages/config/service_url.dart';
import 'package:flutter_shop/pages/service/service_method.dart';
import 'package:flutter_shop/provide/CategoryChildProvide.dart';
import 'package:flutter_shop/provide/CategoryGoodsProvide.dart';
import 'package:flutter_shop/routes/navigator_util.dart';
import 'package:flutter_shop/util.dart';
import 'package:provide/provide.dart';

//分類商品列表
class CategoryGoods extends StatefulWidget {
  @override
  _CategoryGoodsState createState() => _CategoryGoodsState();
}

class _CategoryGoodsState extends State<CategoryGoods> {
  EasyRefreshController _controller = EasyRefreshController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsProvide>(
        builder: (context, child, categoryGoodsProvide) {
      if (categoryGoodsProvide.categoryGoodsList.length > 0) {
        return Expanded(
            child: Container(
                width: ScreenUtil().setWidth(570),
                child: EasyRefresh(
                  header: MaterialHeader(),
                  footer: MaterialFooter(),
                  controller: _controller,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return _getListView(
                          categoryGoodsProvide.categoryGoodsList[index]);
                    },
                    itemCount: categoryGoodsProvide.categoryGoodsList.length,
                  ),
                  onRefresh: () async {
                    Provide.value<CategoryChildProvide>(context).clearPage();
                    _getCategoryGoods();
                  },
                  onLoad: () async {
                    Provide.value<CategoryChildProvide>(context).addPage();
                    _getCategoryGoods();
                  },
                )));
      } else {
        return Container(
          child: Text("暂无数据..."),
        );
      }
    });
  }

  //商品图片
  Widget _getImageView(String imgUrl) {
    return Container(
      padding: EdgeInsets.all(10),
      width: ScreenUtil().setWidth(200),
      child: Image.network(imgUrl, fit: BoxFit.cover),
    );
  }

  //商品名称
  Widget _getGoodsName(String name) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 15, 10),
      width: ScreenUtil().setWidth(370),
      child: Text(
        name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  //商品价格
  Widget _getGoodsPrice(double oriPrice, double presentPrice) {
    return Container(
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          Text(
            "价格:￥$presentPrice",
            style:
                TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.pink),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(3),
          ),
          Text(
            "￥$oriPrice",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(20),
                color: Colors.grey,
                decoration: TextDecoration.lineThrough),
          )
        ],
      ),
    );
  }

  //商品列表item
  Widget _getListView(CategoryGoodsBean goodsBean) {
    return InkWell(
      onTap: () {
        print("點擊商品 ${goodsBean.goodsName}");
        NavigatorUtil.toGoodsDetailPage(context, goodsBean.goodsId);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(color: Colors.black12, width: 1))),
        child: Row(
          children: <Widget>[
            _getImageView(goodsBean.image),
            Column(
              children: <Widget>[
                _getGoodsName(goodsBean.goodsName),
                _getGoodsPrice(goodsBean.oriPrice, goodsBean.presentPrice)
              ],
            )
          ],
        ),
      ),
    );
  }

  //获取 商品列表 数据
  void _getCategoryGoods() {
    print("加载数据 --- ${Provide.value<CategoryChildProvide>(context).page}");
    var data = {
      'categoryId': Provide.value<CategoryChildProvide>(context).categoryMainId,
      'categorySubId':
          Provide.value<CategoryChildProvide>(context).categorySubId,
      'page': Provide.value<CategoryChildProvide>(context).page
    };
    getRequestContent(CATEGORY_GOODS, formData: data).then((val) {
      var jsonMap = json.decode(val.toString());
      CategoryGoodsModel model = CategoryGoodsModel.fromJson(jsonMap);
      if (model.data == null) {
        _controller.finishLoad(noMore: true);
        showToast(S.of(context).no_more, context);
      } else {
        Provide.value<CategoryGoodsProvide>(context).addGoodsList(model.data);
      }
    });
  }
}
