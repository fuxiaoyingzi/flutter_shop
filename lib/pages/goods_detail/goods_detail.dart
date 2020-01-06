import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/bean/goods_detail_bean.dart';
import 'package:flutter_shop/pages/config/service_url.dart';
import 'package:flutter_shop/pages/service/service_method.dart';

import 'goods_detail_top.dart';

class GoodsDetail extends StatefulWidget {
  String goodsId;

  GoodsDetail(this.goodsId);

  @override
  _GoodsDetailState createState() => _GoodsDetailState();
}

class _GoodsDetailState extends State<GoodsDetail> {
  GoodsDetailData mGoodsDetailData;

  @override
  void initState() {
    super.initState();
    mGoodsDetailData = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text(
          mGoodsDetailData != null
              ? mGoodsDetailData.goodInfo.goodsName
              : "商品详情",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var jsonMap = json.decode(snapshot.data.toString());
            var mGoodsDetail = GoodsDetailModel.fromJson(jsonMap).data;
            Future.delayed(Duration(milliseconds: 200)).then((e) {
              setState(() {
                mGoodsDetailData = mGoodsDetail;
              });
            });
            return Container(
              child: ListView(
                children: <Widget>[
                  GoodsDetailTopArea(mGoodsDetail),
                ],
              ),
            );
          } else {
            return Text("加载中....");
          }
        },
        future: _getGoodsDetail(context),
      ),
    );
  }

  Future _getGoodsDetail(BuildContext context) async {
    var data = {
      'goodId': widget.goodsId,
    };
    return getRequestContent(GOODS_DETAIL, formData: data);
  }
}
