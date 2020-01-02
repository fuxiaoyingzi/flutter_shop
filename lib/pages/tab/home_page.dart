import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_shop/generated/i18n.dart';
import 'package:flutter_shop/pages/config/service_url.dart';
import 'package:flutter_shop/pages/service/service_method.dart';
import 'package:flutter_shop/pages/tab/home/home_floor.dart';
import 'package:flutter_shop/pages/tab/home/home_top_navigator.dart';
import 'package:flutter_shop/util.dart';

import 'home/home_ad_banner.dart';
import 'home/home_below_content.dart';
import 'home/home_recommend_goods.dart';
import 'home/home_store_info.dart';
import 'home/home_swipper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List<Map> hotGoodsList = [];
  int page = 1;

  EasyRefreshController _controller = EasyRefreshController();

  @override
  Widget build(BuildContext context) {
    var formData = {"lon": "115.02932", "lat": "37.76189"};
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

            //楼层商品数据
            var floor1Pic = (dataMap["floor1Pic"]["PICTURE_ADDRESS"]);
            var floor2Pic = (dataMap["floor2Pic"]["PICTURE_ADDRESS"]);
            var floor3Pic = (dataMap["floor3Pic"]["PICTURE_ADDRESS"]);

            var floor1 = (dataMap["floor1"] as List).cast(); //集合map banner数据
            var floor2 = (dataMap["floor2"] as List).cast(); //集合map banner数据
            var floor3 = (dataMap["floor3"] as List).cast(); //集合map banner数据

            return EasyRefresh(
              controller: _controller,
              header: MaterialHeader(),
              footer: MaterialFooter(),
              child: ListView(
                children: <Widget>[
                  SwiperDiy(swipData),
                  TopNavigator(navigatorData),
                  AdBanner(adPicUrl),
                  StoreInfo(leaderImage, leaderPhone),
                  RecommendGoods(recommendList),
                  HomeFloorView(floor1Pic, floor1),
                  HomeFloorView(floor2Pic, floor2),
                  HomeFloorView(floor3Pic, floor3),
                  HomeHotGoods(hotGoodsList)
                ],
              ),
              onLoad: () async {
                var formData = {"page": page};
                await getRequestContent(HOME_PAGE_BELOW_CONTENT,
                    formData: formData)
                    .then((val) {
                  var data = json.decode(val.toString());

                  if (data['data'] as List != null) {
                    List<Map> newGoods = (data['data'] as List).cast();
                    setState(() {
                      hotGoodsList.addAll(newGoods);
                      page++;
                    });
                  } else {
                    //加载结束
                    showToast(S.of(context).no_more, context);
                  }

                  _controller.finishLoad(noMore: data['data'] as List == null);
                });
              },
            );
          } else {
            return Center(
              child: Text("正在加载中...."),
            );
          }
        },
        future: getRequestContent(HOME_PAGE_CONTENT, formData: formData),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
