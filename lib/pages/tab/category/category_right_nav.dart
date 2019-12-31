import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/bean/CategoryBean.dart';
import 'package:flutter_shop/provide/CategoryChild.dart';
import 'package:provide/provide.dart';

///分类 右边 二级顶部导航
class CategoryRightNav extends StatefulWidget {
  @override
  _CategoryRightNavState createState() => _CategoryRightNavState();
}

class _CategoryRightNavState extends State<CategoryRightNav> {
  @override
  Widget build(BuildContext context) {
    return Provide<CategoryChild>(builder: (context, child, categoryChild) {
      return Container(
        height: ScreenUtil().setHeight(100),
        width: ScreenUtil().setWidth(570),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _getItemView(categoryChild.bxMallSubDto[index]);
          },
          itemCount: categoryChild.bxMallSubDto.length,
        ),
      );
    });
  }

  Widget _getItemView(BxMallSubDto secondCategory) {
    return Container(
      height: ScreenUtil().setHeight(100),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.black12, width: 1))),
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: Text(secondCategory.mallSubName),
    );
  }
}
