import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/bean/CategoryBean.dart';
import 'package:flutter_shop/pages/config/service_url.dart';
import 'package:flutter_shop/pages/service/service_method.dart';
import 'package:flutter_shop/pages/tab/category/category_left_nav.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  //分类列表数据
  List<CategoryData> dataList = [];

  @override
  void initState() {
    super.initState();
    _getCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "商品分类",
          style: TextStyle(fontSize: 28),
        ),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            CategoryLeftNav(dataList),
            Center(
              child: Text("hello shadow"),
            )
          ],
        ),
      ),
    );
  }

  void _getCategoryData() {
    getRequestContent(CATEGORY_CONTENT).then((val) {
      Map userMap = json.decode(val.toString());
      var categoryBean = CategoryEntity.fromJson(userMap);
      setState(() {
        dataList = categoryBean.data;
        print(dataList.length);
      });
    });
  }
}
