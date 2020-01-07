import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_shop/generated/i18n.dart';
import 'package:flutter_shop/pages/index_page.dart';
import 'package:flutter_shop/provide/CategoryChildProvide.dart';
import 'package:flutter_shop/provide/CategoryGoodsProvide.dart';
import 'package:flutter_shop/provide/TestProvide.dart';
import 'package:flutter_shop/provide/cart_info.dart';
import 'package:flutter_shop/provide/goods_detail.dart';
import 'package:flutter_shop/routes/application.dart';
import 'package:flutter_shop/routes/routes.dart';
import 'package:provide/provide.dart';

void main() {
  //状态保存
  final providers = Providers()
    ..provide(Provider.function((context) => Counter(0)))
    ..provide(Provider.function((context) => CategoryGoodsProvide()))
    ..provide(Provider.function((context) => CategoryChildProvide()))
    ..provide(Provider.function((context) => CartInfoProvider()))
    ..provide(Provider.function((context) => GoodsDetailProvider()));

  // 注册 fluro routes
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  //runApp(MyApp());

  runApp(ProviderNode(
    providers: providers,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '百姓生活+',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: IndexPage(),
        onGenerateRoute: Application.router.generator,
        localizationsDelegates: [
          S.delegate,
          GlobalEasyRefreshLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
