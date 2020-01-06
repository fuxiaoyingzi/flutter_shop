/*
* 在实际开发中，我们是将业务逻辑和UI表现分开的，所以线建立一个Provide文件，所有业务逻辑将写在Provide里，
* 然后pages文件夹里只写UI层面的东西。这样就把业务逻辑和UI进行了分离。
* */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/bean/goods_detail_bean.dart';
import 'package:flutter_shop/pages/config/service_url.dart';
import 'package:flutter_shop/pages/service/service_method.dart';

class GoodsDetailProvider with ChangeNotifier {
  GoodsDetailData mGoodsDetailData = null;

  Future getGoodsDetail(String goodsId) {
    var data = {
      'goodId': goodsId,
    };
    return getRequestContent(GOODS_DETAIL, formData: data).then((val) {
      var jsonMap = json.decode(val.toString());
      mGoodsDetailData = GoodsDetailModel.fromJson(jsonMap).data;
      notifyListeners();
    });
  }

  void clearGoodsInfo() {
    mGoodsDetailData = null;
  }
}
