import 'package:flutter/material.dart';
import 'package:flutter_shop/bean/category_goods_beanean.dart';

class CategoryGoodsProvide with ChangeNotifier {
  //二級分類 列表
  String mallCategoryId = "4";
  String mallSubId = "";
  List<CategoryGoodsBean> categoryGoodsList = [];

  void changeGoodsList(List<CategoryGoodsBean> goodsList) {
    categoryGoodsList.clear();
    if (goodsList != null) {
      categoryGoodsList.addAll(goodsList);
    }
    notifyListeners();
  }


  void addGoodsList(List<CategoryGoodsBean> goodsList) {
    if (goodsList != null) {
      categoryGoodsList.addAll(goodsList);
    }
    notifyListeners();
  }

  //修改大类id
  void setMainId(String mainId) {
    this.mallCategoryId = mainId;
    notifyListeners();
  }

  //修改 二级分类id
  void setMallSubId(String subId) {
    this.mallSubId = subId;
    notifyListeners();
  }
}
