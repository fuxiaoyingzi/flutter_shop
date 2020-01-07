import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartBottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[_checkAll(), _orderPrice(), _buyNow()],
      ),
    );
  }

  Widget _checkAll() {
    return Expanded(
        child: Container(
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Checkbox(
            value: true,
            onChanged: (val) {
              print("改变全选 == $val");
            },
            activeColor: Colors.pinkAccent,
          ),
          SizedBox(
            width: 10,
          ),
          Text("全选")
        ],
      ),
    ));
  }

  Widget _orderPrice() {
    return Expanded(
        flex: 2,
        child: Container(
          alignment: Alignment.centerRight,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: '合计：',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(
                          text: '￥1992.68 ',
                          style: TextStyle(
                              fontSize: 16, color: Colors.pinkAccent)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "满10元免配送费，预购免配送费",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                )
              ]),
        ));
  }

  Widget _buyNow() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.all(Radius.circular(3))),
        child: Text(
          "结算(6)",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
