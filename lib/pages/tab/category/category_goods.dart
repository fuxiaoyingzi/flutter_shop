
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/bean/CategoryGoodsBean.dart';
import 'package:flutter_shop/provide/CategoryGoodsProvide.dart';
import 'package:provide/provide.dart';

//分類商品列表
class CategoryGoods extends StatefulWidget {
  @override
  _CategoryGoodsState createState() => _CategoryGoodsState();
}

class _CategoryGoodsState extends State<CategoryGoods> {
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
          child: ListView.builder(
            itemBuilder: (context, index) {
              return _getListView(
                  categoryGoodsProvide.categoryGoodsList[index]);
            },
            itemCount: categoryGoodsProvide.categoryGoodsList.length,
          ),
        ));
      } else {
        return Container(
          child: Text("正在加载数据..."),
        );
      }
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
