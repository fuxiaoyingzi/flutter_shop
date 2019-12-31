import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/bean/CategoryBean.dart';
import 'package:flutter_shop/provide/CategoryChild.dart';
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
  Widget build(BuildContext context) {
    if (widget.categoryData != null && widget.categoryData.length > 0) {
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
        setState(() {
          currentIndex = index;
        });
        Provide.value<CategoryChildProvide>(context)
            .setCategoryChildList(widget.categoryData[index].bxMallSubDto);
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
}
