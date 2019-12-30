import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/bean/CategoryBean.dart';
import 'package:flutter_shop/pages/config/service_url.dart';
import 'package:flutter_shop/pages/service/service_method.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    _getCategoryData();
    return Container(
      child: Text("分类页面"),
    );
  }

  void _getCategoryData() {
    getRequestContent(CATEGORY_CONTENT).then((val) {
      /* var clipboard = ClipboardData(text: val.toString());
      Clipboard.setData(clipboard);
      print(val.toString());*/

      Map userMap = json.decode(val.toString());
      var categoryBean = CategoryEntity.fromJson(userMap);
      categoryBean.data.forEach((item) {
        print(item.mallCategoryName);
      });
    });
  }
}
