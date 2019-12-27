import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
            return Column(
              children: <Widget>[
                SwiperDiy(swipData),
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

/**
 * 顶部 轮播图
 * "data": {
    "slides": [{
    "image": "https://images.baixingliangfan.cn/advertesPicture/20191225/20191225165514_1990.jpg",
    "urlType": 1,
    "goodsId": "/pages/groupBuy/pages/group-list/group-list"
    }
 */
class SwiperDiy extends StatelessWidget {
  List swiperList;

  SwiperDiy(this.swiperList);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    print('设备宽度:${ScreenUtil.screenWidth}'); //Device width
    print('设备高度:${ScreenUtil.screenHeight}'); //Device height
    print('设备的像素密度:${ScreenUtil.pixelRatio}'); //Device pixel density
    print(
        '底部安全区距离:${ScreenUtil.bottomBarHeight}'); //Bottom safe zone distance，suitable for buttons with full screen
    print(
        '状态栏高度:${ScreenUtil.statusBarHeight}px'); //Status bar height , Notch will be higher Unit px

    return Container(
      height: ScreenUtil().setHeight(333),
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            swiperList[index]["image"],
            fit: BoxFit.fill,
          );
        },
        itemCount: swiperList.length,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
        autoplay: true,
        onTap: (index) {
          print("点击了$index");
        },
      ),
    );
  }
}
