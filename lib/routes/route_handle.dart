import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/goods_detail/goods_detail.dart';
import 'package:flutter_shop/pages/tab/home/home_page.dart';

import 'common_key.dart';

/// 跳转到主页
var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

/// 跳转 到 商品详情 参数传递 params["goodsId"]?.first 相当于 params["goodsId"][0]
var goodsDetailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String goodsId = params[ArgumentKey.KEY_GOODS_ID]?.first;
  return GoodsDetail(goodsId);
});
