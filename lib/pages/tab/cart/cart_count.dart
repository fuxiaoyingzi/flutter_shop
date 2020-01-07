import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartCountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(47),
      width: ScreenUtil().setWidth(170),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black12, width: 1)),
      child: Row(
        children: <Widget>[_countBtn(false), _countData(), _countBtn(true)],
      ),
    );
  }

  Widget _countBtn(bool isAdd) {
    return InkWell(
      onTap: () {
        isAdd ? print("添加数量") : print("减少数量");
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        child: Text(isAdd ? "+" : "-"),
      ),
    );
  }

  Widget _countData() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              left: BorderSide(width: 1, color: Colors.black12),
              right: BorderSide(width: 1, color: Colors.black12))),
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(75),
      height: ScreenUtil().setHeight(45),
      child: Text("1"),
    );
  }
}
