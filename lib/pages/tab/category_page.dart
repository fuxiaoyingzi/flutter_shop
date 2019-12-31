import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/bean/CategoryBean.dart';
import 'package:flutter_shop/pages/config/service_url.dart';
import 'package:flutter_shop/pages/service/service_method.dart';
import 'package:flutter_shop/pages/tab/category/category_left_nav.dart';
import 'package:flutter_shop/provide/CategoryChildProvide.dart';
import 'package:provide/provide.dart';

import 'category/category_goods.dart';
import 'category/category_right_nav.dart';

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
            Column(
              children: <Widget>[CategoryRightNav(), CategoryGoods()],
            ),
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
      });

      //初始化 提供 二级分类数据
      if (dataList.length > 0) {
        Provide.value<CategoryChildProvide>(context).setCategoryChildList(
            dataList[0].bxMallSubDto, dataList[0].mallCategoryId);
      }
    });
  }
}
