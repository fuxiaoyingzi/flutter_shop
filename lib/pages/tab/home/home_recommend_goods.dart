import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendGoods extends StatelessWidget {
  List recommendList;

  RecommendGoods(this.recommendList);

  //标题栏
  Widget _getTitleView() {
    return Container(
      height: ScreenUtil().setHeight(80),
      padding: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(color: Colors.black12, width: 0.5))),
      child: Text(
        "商品推荐",
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  //商品item
  Widget _getGoodsItem(index) {
    return InkWell(
      onTap: () {
        print("点击商品--$index");
      },
      child: Container(
        height: ScreenUtil().setHeight(400),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(left: BorderSide(color: Colors.black12, width: 0.5))),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]["image"]),
            Text("￥${recommendList[index]["mallPrice"]}"),
            Text(
              "￥${recommendList[index]["price"]}",
              style: TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

//集合
  Widget _getListView() {
    return Container(
      height: ScreenUtil().setHeight(400),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _getGoodsItem(index);
        },
        itemCount: recommendList.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
     child: Column(
       children: <Widget>[
         _getTitleView(),
         _getListView()
       ],
     ),
    );
  }
}
