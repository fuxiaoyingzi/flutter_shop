import 'package:flutter/material.dart';

class MineOrderWidget extends StatelessWidget {
  int type; //1:我的订单 2：领取优惠券 3：已领取优惠券 4：地址管理 5：客服电话

  MineOrderWidget(this.type);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Icon(
            _getIcon(),
            size: 20,
            color: Colors.black26,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 2,
              child: Text(
                _getTitle(),
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black26),
              )),
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: Colors.black26,
          )
        ],
      ),
    );
  }

  //获取图标
  IconData _getIcon() {
    var icon = Icons.favorite_border;
    switch (type) {
      case 1:
        icon = Icons.collections;
        break;
      case 2:
        icon = Icons.print;
        break;
      case 3:
        icon = Icons.access_alarm;
        break;
      case 4:
        icon = Icons.settings;
        break;

      case 5:
        icon = Icons.stay_current_portrait;
        break;
    }
    return icon;
  }

  //获取标题
  String _getTitle() {
    var icon = "我的订单";
    switch (type) {
      case 2:
        icon = "领取优惠券";
        break;
      case 3:
        icon = "已领取优惠券";
        break;
      case 4:
        icon = "地址管理";
        break;
      case 5:
        icon = "客服电话";
        break;

      case 1:
        icon = "我的订单";
        break;
    }
    return icon;
  }
}
