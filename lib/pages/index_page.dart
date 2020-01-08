import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/tab/cart/cart_page.dart';
import 'package:flutter_shop/pages/tab/category/category_page.dart';
import 'package:flutter_shop/pages/tab/home/home_page.dart';
import 'package:flutter_shop/pages/tab/mine_page.dart';
import 'package:flutter_shop/provide/tab_change.dart';
import 'package:provide/provide.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
    BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("分类")),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text("购物车")),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text("我的")),
  ];

  final List<Widget> tabPages = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Provide<TabChangeProvider>(builder: (context, child, value) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: bottomItem,
          currentIndex: value.currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            value.changeCurrentIndex(index);
          },
        ),
        body: IndexedStack(
          index: value.currentIndex,
          children: tabPages,
        ),
      );
    });
  }
}
