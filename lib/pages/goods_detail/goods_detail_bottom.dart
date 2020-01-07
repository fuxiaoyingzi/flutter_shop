import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/bean/goods_detail_bean.dart';

/**
 * 底部按钮
 */
class GoodsDetailBottom extends StatelessWidget {
  GoodsDetailData mGoodsDetailData;

  GoodsDetailBottom(this.mGoodsDetailData);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(90),
      child: Row(
        children: <Widget>[
          _getShopCarView(),
          _getButton(true),
          _getButton(false),
        ],
      ),
    );
  }

  ///购物车
  _getShopCarView() {
    return InkWell(
      onTap: () {
        print("跳转购物车界面");
      },
      child: Container(
        width: ScreenUtil().setWidth(110),
        height: ScreenUtil().setHeight(90),
        child: Icon(
          Icons.shopping_cart,
          color: Colors.pinkAccent,
        ),
      ),
    );
  }

  ///底部按钮
  _getButton(bool addShopCart) {
    return InkWell(
      onTap: () {
        addShopCart ? print("加入购物车") : print("立即购买");
      },
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(320),
        height: ScreenUtil().setHeight(90),
        color: addShopCart ? Colors.blue : Colors.pinkAccent,
        child: Text(
          addShopCart ? "加入购物车" : "立即购买",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
