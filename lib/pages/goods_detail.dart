import 'package:flutter/material.dart';

class GoodsDetail extends StatelessWidget {
  String goodsId;

  GoodsDetail(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("商品详情 --- $goodsId"),
    );
  }
}
