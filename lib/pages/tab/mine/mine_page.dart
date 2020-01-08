import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/tab/mine/mine_info.dart';
import 'package:flutter_shop/pages/tab/mine/mine_order_statue.dart';

import 'mine_order.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              MineInfoWidget(),
              SizedBox(
                height: 10,
              ),
              MineOrderWidget(1),
              SizedBox(
                height: 10,
              ),
              MineOrderStatusWidget(),
              SizedBox(
                height: 10,
              ),
              MineOrderWidget(2),
              SizedBox(
                height: 1,
              ),
              MineOrderWidget(3),
              SizedBox(
                height: 1,
              ),
              MineOrderWidget(4),
              SizedBox(
                height: 1,
              ),
              MineOrderWidget(5),
            ],
          ),
        ),
      ),
    );
  }
}
