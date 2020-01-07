import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/goods_detail.dart';
import 'package:provide/provide.dart';

class GoodsDetailTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<GoodsDetailProvider>(builder: (context, child, value) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.white,
        width: ScreenUtil().setWidth(750),
        child: Row(
          children: <Widget>[
            getTabView(context,
                Provide.value<GoodsDetailProvider>(context).isLeft, true),
            getTabView(context,
                Provide.value<GoodsDetailProvider>(context).isRight, false)
          ],
        ),
      );
    });
  }

  Widget getTabView(context, bool isClick, bool isLeft) {
    return InkWell(
      onTap: () {
        Provide.value<GoodsDetailProvider>(context).setClick(isLeft, !isLeft);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1,
                    color: isClick ? Colors.pinkAccent : Colors.white))),
        width: ScreenUtil().setWidth(375),
        padding: EdgeInsets.only(top: 12, bottom: 12),
        child: Text(
          isLeft ? "详情" : "评论",
          style: TextStyle(color: isClick ? Colors.pinkAccent : Colors.black),
        ),
      ),
    );
  }
}
