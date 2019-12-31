import 'package:flutter/material.dart';
import 'package:flutter_shop/bean/CategoryBean.dart';

class CategoryChild with ChangeNotifier {
  //二級分類 列表
  List<BxMallSubDto> bxMallSubDto = [];

  /*
  * {
      "mallSubId": "2c9f6c946cd22d7b016cd73dba110031",
      "mallCategoryId": "2c9f6c946cd22d7b016cd732f0f6002f",
      "mallSubName": "酒水饮料",
      "comments": null
      }
  * */
  void setCategoryChildList(List<BxMallSubDto> dataList) {
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
}