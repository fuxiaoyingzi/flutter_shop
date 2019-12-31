import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/bean/CategoryGoodsBean.dart';
import 'package:flutter_shop/pages/config/service_url.dart';
import 'package:flutter_shop/pages/service/service_method.dart';

//分類商品列表
class CategoryGoods extends StatefulWidget {
  @override
  _CategoryGoodsState createState() => _CategoryGoodsState();
}

class _CategoryGoodsState extends State<CategoryGoods> {
  //商品列表
  List<CategoryGoodsBean> list = [];

  @override
  void initState() {
    super.initState();
    _getCategoryGoods();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          width: ScreenUtil().setWidth(570),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return _getListView(list[index]);
            },
            itemCount: list.length,
          ),
        ));
  }

  void _getCategoryGoods() {
    var data = {'categoryId': '4', 'categorySubId': "", 'page': 1};
    getRequestContent(CATEGORY_GOODS, formData: data).then((val) {
      var jsonMap = json.decode(val.toString());
      CategoryGoodsModel model = CategoryGoodsModel.fromJson(jsonMap);
      setState(() {
        list = model.data;
      });
    });
  }

  Widget _getImageView(String imgUrl) {
    return Container(
      padding: EdgeInsets.all(10),
      width: ScreenUtil().setWidth(200),
      child: Image.network(imgUrl, fit: BoxFit.cover),
    );
  }

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
          SizedBox(width: ScreenUtil().setWidth(3),),
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

  Widget _getListView(CategoryGoodsBean goodsBean) {
    return InkWell(
      onTap: () {
        print("點擊商品 ${goodsBean.goodsName}");
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
}
