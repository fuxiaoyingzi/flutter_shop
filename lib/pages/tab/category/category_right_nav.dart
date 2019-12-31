import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/bean/CategoryBean.dart';
import 'package:flutter_shop/provide/CategoryChildProvide.dart';
import 'package:flutter_shop/provide/CategoryGoodsProvide.dart';
import 'package:provide/provide.dart';

///分类 右边 二级顶部导航
class CategoryRightNav extends StatefulWidget {
  @override
  _CategoryRightNavState createState() => _CategoryRightNavState();
}

class _CategoryRightNavState extends State<CategoryRightNav> {
  @override
  Widget build(BuildContext context) {
    return Provide<CategoryChildProvide>(
        builder: (context, child, categoryChild) {
      return Container(
        height: ScreenUtil().setHeight(100),
        width: ScreenUtil().setWidth(570),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _getItemView(index, categoryChild.bxMallSubDto[index]);
          },
          itemCount: categoryChild.bxMallSubDto.length,
        ),
      );
    });
  }

  Widget _getItemView(int index, BxMallSubDto secondCategory) {
    bool isClick = false;
    isClick = index == Provide.value<CategoryChildProvide>(context).changeIndex;
    return InkWell(
      onTap: () {
        Provide.value<CategoryChildProvide>(context).setChangeIndex(index);

        //修改商品列表数据
       /* Provide.value<CategoryGoodsProvide>(context)
            .setMallSubId(secondCategory.mallSubId);*/
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(color: Colors.black12, width: 1))),
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(
          secondCategory.mallSubName,
          style: TextStyle(color: isClick ? Colors.pink : Colors.black),
        ),
      ),
    );
  }
}
