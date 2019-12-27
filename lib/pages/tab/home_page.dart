import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/service/service_method.dart';
import 'package:flutter_shop/pages/tab/home/home_top_navigator.dart';

import 'home/home_swipper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("百姓生活+"),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = json.decode(snapshot.data.toString());
            var swipData =
                (data["data"]["slides"] as List).cast(); //集合map banner数据
            var navigatorData =
                (data["data"]["category"] as List).cast(); //集合map banner数据
            return Column(
              children: <Widget>[
                SwiperDiy(swipData),
                TopNavigator(navigatorData)
              ],
            );
          } else {
            return Center(
              child: Text("正在加载中...."),
            );
          }
        },
        future: getHomePageContent(),
      ),
    );
  }
}
