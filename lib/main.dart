import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/index_page.dart';
import 'package:flutter_shop/provide/CategoryChild.dart';
import 'package:flutter_shop/provide/TestProvide.dart';
import 'package:provide/provide.dart';

void main() {
  //状态保存
  final providers = Providers()
    ..provide(Provider.function((context) => Counter(0)))
    ..provide(Provider.function((context) => CategoryChildProvide()));

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
      ),
    );
  }
}
