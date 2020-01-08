import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/bean/goods_detail_bean.dart';
import 'package:flutter_shop/provide/cart_info.dart';
import 'package:flutter_shop/provide/tab_change.dart';
import 'package:flutter_shop/util.dart';
import 'package:provide/provide.dart';

///商品详情 底部按钮
class GoodsDetailBottom extends StatelessWidget {
  GoodsDetailData mGoodsDetailData;

  GoodsDetailBottom(this.mGoodsDetailData);

  @override
  Widget build(BuildContext context) {
    Provide.value<CartInfoProvider>(context).getCartListCount();

    return Provide<CartInfoProvider>(builder: (context, child, value) {
      return Container(
        color: Colors.white,
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(90),
        child: Row(
          children: <Widget>[
            _getShopCarView(context),
            _getButton(context, true),
            _getButton(context, false),
          ],
        ),
      );
    });
  }

  ///购物车
  _getShopCarView(context) {
    return InkWell(
      onTap: () {
        //跳转购物车
        Provide.value<TabChangeProvider>(context).changeCurrentIndex(2);
        Navigator.pop(context);
      },
      child: Stack(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(110),
            height: ScreenUtil().setHeight(90),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.pinkAccent,
            ),
          ),
          Positioned(
              top: 3,
              right: 5,
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1)),
                child: Text(
                  "${Provide.value<CartInfoProvider>(context).addGoodsCount}",
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(20)),
                ),
              ))
        ],
      ),
    );
  }

  ///底部按钮
  _getButton(context, bool addShopCart) {
    return InkWell(
      onTap: () async {
        if (addShopCart) {
          bool res = await Provide.value<CartInfoProvider>(context).addCart(mGoodsDetailData);
          showToast(res ? "添加购物车成功" : "添加购物车失败", context);
        } else {
          bool res = await Provide.value<CartInfoProvider>(context).cleanCart();
          showToast(res ? "清空购物车成功" : "清空购物车失败", context);
        }
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
