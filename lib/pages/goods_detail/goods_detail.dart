import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/bean/goods_detail_bean.dart';
import 'package:flutter_shop/pages/config/service_url.dart';
import 'package:flutter_shop/pages/service/service_method.dart';
import 'package:flutter_shop/provide/goods_detail.dart';
import 'package:provide/provide.dart';

import 'goods_detail_bottom.dart';
import 'goods_detail_tabbar.dart';
import 'goods_detail_top.dart';
import 'goods_web.dart';

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

  Widget _getContentView() {
    return Stack(
      children: <Widget>[
        Container(
          child: ListView(
            children: <Widget>[
              GoodsDetailTopArea(mGoodsDetailData),
              GoodsDetailTabBar(),
              GoodsWebPage(mGoodsDetailData)
            ],
          ),
        ),
        Positioned(
          child: GoodsDetailBottom(mGoodsDetailData),
          left: 0,
          bottom: 0,
          right: 0,
        )
      ],
    );
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
          Provide.value<GoodsDetailProvider>(context).mGoodsDetailData != null
              ? Provide.value<GoodsDetailProvider>(context).mGoodsDetailData.goodInfo.goodsName
              : "商品详情",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var jsonMap = json.decode(snapshot.data.toString());
            mGoodsDetailData = GoodsDetailModel.fromJson(jsonMap).data;
            Provide.value<GoodsDetailProvider>(context).updateGoodsDetailData(mGoodsDetailData);
            return _getContentView();
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
    return await getRequestContent(GOODS_DETAIL, formData: data);
  }
}
