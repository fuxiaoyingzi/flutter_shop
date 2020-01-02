import 'package:flutter/material.dart';
import 'package:flutter_shop/routes/common_key.dart';
import 'package:flutter_shop/routes/routes.dart';
import 'application.dart';

///跳转工具类
class NavigatorUtil {
  static void goHomePage(BuildContext context) {
    /// Routes.home 路由地址
    /// replace：true 就是将 splash 页面给移除掉了，这点后退键的时候就不会再出现Splash页面
    Application.router.navigateTo(context, Routes.home, replace: true);
  }

  /// 跳转到商品详情 传参
  static void toGoodsDetailPage(BuildContext context, String goodsId) {
    Application.router.navigateTo(
        context, Routes.goodsDetail + "?${ArgumentKey.KEY_GOODS_ID}=$goodsId");
  }
}
