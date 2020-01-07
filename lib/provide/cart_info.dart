import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/bean/cart_info_bean.dart';
import 'package:flutter_shop/bean/goods_detail_bean.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartInfoProvider with ChangeNotifier {
  List<CartInfoModel> cartInfoList = [];

  static final String CART_INFO = "cartInfo";

  ///添加商品 到购物车
  void addCart(GoodsDetailData mGoodsDetailData) async {
    var sp = await SharedPreferences.getInstance();
    List<Map> tempList = await _getSpData(sp);

    bool isHave = false;
    for (int i = 0; i < tempList.length; i++) {
      if (tempList[i]["goodsId"] == mGoodsDetailData.goodInfo.goodsId) {
        tempList[i]["count"] = tempList[i]["count"] + 1;
        cartInfoList[i].count++;
        isHave = true;
        break;
      }
    }

    //没有老数据
    if (!isHave) {
      var jsonMap = {
        "goodsId": mGoodsDetailData.goodInfo.goodsId,
        "goodsName": mGoodsDetailData.goodInfo.goodsName,
        "goodsPrice": mGoodsDetailData.goodInfo.presentPrice,
        "goodsImg": mGoodsDetailData.goodInfo.image1,
        "count": 1,
        "isCheck": true
      };
      tempList.add(jsonMap);
      cartInfoList.add(CartInfoModel.fromJson(jsonMap));
    }

    print(
        "加入购物车=============>${json.encode(tempList).toString()} ==== cartInfoList.length = ${cartInfoList.length}");
    var tempJson = json.encode(tempList).toString();
    sp.setString(CART_INFO, tempJson);
    notifyListeners();
  }

  ///清空购物车
  void cleanCart() async {
    var sp = await SharedPreferences.getInstance();
    sp.remove(CART_INFO);
    cartInfoList = [];
    notifyListeners();
    print("清空购物车......");
  }

  //获取购物车列表
  void getCartList() async {
    var sp = await SharedPreferences.getInstance();
    var tempList = await _getSpData(sp);
    cartInfoList = [];
    tempList.forEach((item) {
      cartInfoList.add(CartInfoModel.fromJson(item));
    });
    notifyListeners();
  }

  /**
   * 删除数据
   */
  void deleteGoods(String goodsId) async {
    var sp = await SharedPreferences.getInstance();
    var tempList = await _getSpData(sp);

    for (int i = 0; i < tempList.length; i++) {
      if (tempList[i]["goodsId"] == goodsId) {
        tempList.removeAt(i);
        break;
      }
    }

    var tempJson = json.encode(tempList).toString();
    sp.setString(CART_INFO, tempJson);
    getCartList();
  }

  ///获取 sp数据
  Future<List<Map>> _getSpData(SharedPreferences sp) async {
    var tempJson;
    if (sp.getString(CART_INFO) != null) {
      tempJson = json.decode(sp.getString(CART_INFO));
    }
    List<Map> tempList = [];
    if (tempJson != null) {
      tempList = (tempJson as List).cast();
    }
    return tempList;
  }
}
