import 'package:flutter/material.dart';
import 'package:flutter_shop/bean/category_bean.dart';

class CategoryChildProvide with ChangeNotifier {
  //二級分類 列表
  List<BxMallSubDto> bxMallSubDto = [];
  int changeIndex; //子类切换
  String categoryMainId = "4"; //大类id
  String categorySubId = ""; //子类id
  int page = 1; //加载分页

  //切换 一级分类
  void setCategoryChildList(
      List<BxMallSubDto> dataList, String categoryMainId) {
    page = 1;
    this.categoryMainId = categoryMainId;
    changeIndex = 0;
    bxMallSubDto.clear();
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = "00";
    all.mallCategoryId = "00";
    all.mallSubName = "全部";
    all.comments = null;
    bxMallSubDto.add(all);
    bxMallSubDto.addAll(dataList);
    notifyListeners();
  }

  //切换 二级分类
  void setChangeIndex(int currentIndex, String categorySubId) {
    page = 1;
    this.categorySubId = categorySubId;
    this.changeIndex = currentIndex;
    notifyListeners();
  }

  //增加分页
  void addPage() {
    page++;
  }

  void clearPage() {
    page = 1;
  }
}
