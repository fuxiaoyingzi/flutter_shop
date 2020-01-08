import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/bean/cart_info_bean.dart';
import 'package:flutter_shop/bean/goods_detail_bean.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartInfoProvider with ChangeNotifier {
  List<CartInfoModel> cartInfoList = [];

  static final String CART_INFO = "cartInfo";

  //是否全选
  bool checkAll = true;

  //选中结算价格
  double checkPrice = 0;

  //选中结算数量
  int checkCount = 0;

  //购物车 商品数量
  int addGoodsCount = 0;

  void getCartListCount() async {
    var sp = await SharedPreferences.getInstance();
    List<Map> tempList = await _getSpData(sp);
    addGoodsCount = 0;
    for (int i = 0; i < tempList.length; i++) {
      addGoodsCount += cartInfoList[i].count;
    }
    notifyListeners();
  }

  ///添加商品 到购物车
  Future<bool> addCart(GoodsDetailData mGoodsDetailData) async {
    var sp = await SharedPreferences.getInstance();
    List<Map> tempList = await _getSpData(sp);
    addGoodsCount = 0;
    bool isHave = false;
    for (int i = 0; i < tempList.length; i++) {
      if (tempList[i]["goodsId"] == mGoodsDetailData.goodInfo.goodsId) {
        tempList[i]["count"] = tempList[i]["count"] + 1;
        cartInfoList[i].count++;
        isHave = true;
      }
      addGoodsCount += cartInfoList[i].count;
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
      addGoodsCount += 1;
      tempList.add(jsonMap);
      cartInfoList.add(CartInfoModel.fromJson(jsonMap));
    }

    var tempJson = json.encode(tempList).toString();
    sp.setString(CART_INFO, tempJson);
    notifyListeners();
    return true;
  }

  ///清空购物车
  Future<bool> cleanCart() async {
    var sp = await SharedPreferences.getInstance();
    sp.remove(CART_INFO);
    cartInfoList = [];
    addGoodsCount = 0;
    notifyListeners();
    return true;
  }

  //获取购物车列表
  void getCartList() async {
    var sp = await SharedPreferences.getInstance();
    var tempList = await _getSpData(sp);
    _getCartList(sp, tempList);
  }

  ///转换购物车列表
  void _getCartList(SharedPreferences sp, List<Map> tempList) async {
    cartInfoList = [];
    checkAll = true;
    checkCount = 0;
    checkPrice = 0;

    tempList.forEach((item) {
      var cartInfoModel = CartInfoModel.fromJson(item);
      cartInfoList.add(cartInfoModel);
      if (cartInfoModel.isCheck) {
        checkPrice += cartInfoModel.count * cartInfoModel.goodsPrice;
        checkCount += cartInfoModel.count;
      } else {
        checkAll = false;
      }
    });
    notifyListeners();
  }

  ///删除数据
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
    await _getCartList(sp, tempList);
  }

  ///全选
  void checkAllGoods(bool isCheckAll) async {
    var sp = await SharedPreferences.getInstance();
    var tempList = await _getSpData(sp);
    tempList.forEach((val) {
      val["isCheck"] = isCheckAll;
    });

    var tempJson = json.encode(tempList).toString();
    sp.setString(CART_INFO, tempJson);
    await _getCartList(sp, tempList);
  }

  ///单选
  void changeCheck(goodsId, isCheck) async {
    var sp = await SharedPreferences.getInstance();
    var tempList = await _getSpData(sp);
    for (int index = 0; index < tempList.length; index++) {
      if (tempList[index]["goodsId"] == goodsId) {
        tempList[index]["isCheck"] = isCheck;
        break;
      }
    }

    var tempJson = json.encode(tempList).toString();
    sp.setString(CART_INFO, tempJson);
    await _getCartList(sp, tempList);
  }

  ///改变购买商品的数量
  void changeCount(String goodsId, bool isAdd) async {
    var sp = await SharedPreferences.getInstance();
    var tempList = await _getSpData(sp);
    for (int index = 0; index < tempList.length; index++) {
      if (tempList[index]["goodsId"] == goodsId) {
        if (isAdd) {
          tempList[index]["count"] += 1;
          addGoodsCount += 1;
        } else {
          tempList[index]["count"] -= 1;
          addGoodsCount -= 1;
        }
        break;
      }
    }

    var tempJson = json.encode(tempList).toString();
    sp.setString(CART_INFO, tempJson);
    await _getCartList(sp, tempList);
  }

  ///获取 sp数据库列表数据
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
