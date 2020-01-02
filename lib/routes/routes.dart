import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/routes/route_handle.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String goodsDetail = "/goods_detail";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ERROR===============>ROUTE WAS NOT FOUND !!!");
      return null;
    });

    /// 第一个参数是路由地址，第二个参数是页面跳转和传参，第三个参数是默认的转场动画
    router.define(goodsDetail, handler: goodsDetailHandler);
  }
}
