import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/service/service_method.dart';
import 'package:flutter_shop/pages/tab/home/home_top_navigator.dart';

import 'home/home_ad_banner.dart';
import 'home/home_recommend_goods.dart';
import 'home/home_store_info.dart';
import 'home/home_swipper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("百姓生活+"),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //处理数据
            var data = json.decode(snapshot.data.toString());
            var dataMap = data["data"];
            //轮播图数据
            var swipData = (dataMap["slides"] as List).cast(); //集合map banner数据
            //GridView 分类导航数据
            var navigatorData =
                (dataMap["category"] as List).cast(); //集合map banner数据
            //广告图数据
            var adPicUrl = (dataMap["advertesPicture"]["PICTURE_ADDRESS"]);

            //店铺信息
            var leaderImage = (dataMap["shopInfo"]["leaderImage"]);
            var leaderPhone = (dataMap["shopInfo"]["leaderPhone"]);

            //推荐商品
            var recommendList =
                (dataMap["recommend"] as List).cast(); //集合map banner数据

            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SwiperDiy(swipData),
                  TopNavigator(navigatorData),
                  AdBanner(adPicUrl),
                  StoreInfo(leaderImage, leaderPhone),
                  RecommendGoods(recommendList),
                ],
              ),
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

  @override
  bool get wantKeepAlive => true;
}
