import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/goods_detail.dart';
import 'package:provide/provide.dart';

class GoodsDetailTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isLeft = Provide.value<GoodsDetailProvider>(context).isLeft;
    var isRight = Provide.value<GoodsDetailProvider>(context).isRight;
    return Container(
      margin: EdgeInsets.only(top: 10),
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      child: Row(
        children: <Widget>[
          getTabView(context, "详情", isLeft, true),
          getTabView(context, "评论", isRight, false)
        ],
      ),
    );
  }

  Widget getTabView(context, String tabName, bool isClick, bool isLeft) {
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
          tabName,
          style: TextStyle(color: isClick ? Colors.pinkAccent : Colors.black),
        ),
      ),
    );
  }
}
