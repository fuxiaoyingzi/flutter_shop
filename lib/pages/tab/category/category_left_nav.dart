import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/bean/CategoryBean.dart';
import 'package:flutter_shop/bean/CategoryGoodsBean.dart';
import 'package:flutter_shop/pages/config/service_url.dart';
import 'package:flutter_shop/pages/service/service_method.dart';
import 'package:flutter_shop/provide/CategoryChildProvide.dart';
import 'package:flutter_shop/provide/CategoryGoodsProvide.dart';
import 'package:provide/provide.dart';

class CategoryLeftNav extends StatefulWidget {
  List<CategoryData> categoryData = [];

  CategoryLeftNav(this.categoryData);

  @override
  _CategoryLeftNavState createState() => _CategoryLeftNavState();
}

class _CategoryLeftNavState extends State<CategoryLeftNav> {
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.categoryData != null && widget.categoryData.length > 0) {
      if (Provide.value<CategoryGoodsProvide>(context)
              .categoryGoodsList
              .length ==
          0) {
        _getCategoryGoods(widget.categoryData[0].mallCategoryId);
      }

      return Container(
        width: ScreenUtil().setWidth(180),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return _getItemView(index);
          },
          itemCount: widget.categoryData.length,
        ),
      );
    } else {
      return Container(
        child: Text("暂无数据"),
      );
    }
  }

  //左侧分类列表数据
  Widget _getItemView(int index) {
    bool isClick = false;
    isClick = currentIndex == index;
    return InkWell(
      onTap: () {
        if (currentIndex != index) {
          //修改二级分类数据
          Provide.value<CategoryChildProvide>(context).setCategoryChildList(
              widget.categoryData[index].bxMallSubDto, widget.categoryData[index].mallCategoryId);

          //修改商品列表数据
          _getCategoryGoods(widget.categoryData[index].mallCategoryId);
        }

        setState(() {
          currentIndex = index;
        });

        /*Provide.value<CategoryGoodsProvide>(context)
            .setMainId(widget.categoryData[index].mallCategoryId);*/
      },
      child: Container(
          width: ScreenUtil().setWidth(180),
          padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
          child: Text(
            widget.categoryData[index].mallCategoryName,
            style: TextStyle(fontSize: ScreenUtil().setSp(28)),
          ),
          decoration: BoxDecoration(
              color:
                  isClick ? Color.fromRGBO(240, 240, 240, 1.0) : Colors.white,
              border: Border(
                  bottom: BorderSide(color: Colors.black12, width: 1),
                  right: BorderSide(color: Colors.black12, width: 1)))),
    );
  }

  //获取 商品列表 数据
  void _getCategoryGoods(String mainId) {
    print("获取 商品列表数据");
    var data = {
      'categoryId': mainId == null ? "4" : mainId,
      'categorySubId': "",
      'page': 1
    };
    getRequestContent(CATEGORY_GOODS, formData: data).then((val) {
      var jsonMap = json.decode(val.toString());
      CategoryGoodsModel model = CategoryGoodsModel.fromJson(jsonMap);
      Provide.value<CategoryGoodsProvide>(context).changeGoodsList(model.data);
    });
  }
}
