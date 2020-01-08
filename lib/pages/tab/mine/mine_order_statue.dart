import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MineOrderStatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _getItem(Icons.access_alarm, "待付款"),
          _getItem(Icons.recent_actors, "待发货"),
          _getItem(Icons.select_all, "待收货"),
          _getItem(Icons.watch, "待评价"),
        ],
      ),
    );
  }

  Widget _getItem(icon, name) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 20,
          color: Colors.black26,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: TextStyle(
            color: Colors.black26,
          ),
        )
      ],
    );
  }
}
