/*
* 在实际开发中，我们是将业务逻辑和UI表现分开的，所以线建立一个Provide文件，所有业务逻辑将写在Provide里，
* 然后pages文件夹里只写UI层面的东西。这样就把业务逻辑和UI进行了分离。
* */

import 'package:flutter/material.dart';
import 'package:flutter_shop/bean/goods_detail_bean.dart';

class GoodsDetailProvider with ChangeNotifier {
  bool isLeft = true;
  bool isRight = false;
  GoodsDetailData mGoodsDetailData;

  void setClick(leftClick, rightClick) {
    isLeft = leftClick;
    isRight = rightClick;
    notifyListeners();
  }

  void updateGoodsDetailData(GoodsDetailData mGoodsDetailData) {
    this.mGoodsDetailData = mGoodsDetailData;
    notifyListeners();
  }
}
