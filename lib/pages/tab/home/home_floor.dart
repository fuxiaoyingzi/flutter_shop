import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFloorView extends StatelessWidget {
  String floorTitle;
  List floorContent;


  HomeFloorView(this.floorTitle, this.floorContent);

  ///标题
  Widget _getFloorTitleView() {
    return Container(
      child: Image.network(floorTitle),
    );
  }

  ///内容
  Widget _getFloorContent() {
    return Row(
      children: <Widget>[
        _goodsItem(floorContent[0]["image"]),
        Column(
          children: <Widget>[
            _goodsItem(floorContent[1]["image"]),
            _goodsItem(floorContent[2]["image"]),
          ],
        )
      ],
    );
  }

  ///底部
  Widget _getFloorFoot() {
    return Row(
      children: <Widget>[
        _goodsItem(floorContent[3]["image"]),
        _goodsItem(floorContent[4]["image"]),
      ],
    );
  }

  ///楼层商品布局
  Widget _goodsItem(String goodImg) {
    return Container(
        width: ScreenUtil().setWidth(375),
        child: InkWell(
          onTap: () {
            print("点击了楼层商品");
          },
          child: Image.network(goodImg),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _getFloorTitleView(),
        _getFloorContent(),
        _getFloorFoot()
      ],
    );
  }
}
