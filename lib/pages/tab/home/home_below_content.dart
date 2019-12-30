import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHotGoods extends StatefulWidget {
  List<Map> hotGoodsList = [];

  HomeHotGoods(this.hotGoodsList);

  @override
  _HomeHotGoodsState createState() => _HomeHotGoodsState(hotGoodsList);
}

class _HomeHotGoodsState extends State<HomeHotGoods> {
  List<Map> hotGoodsList = [];

  _HomeHotGoodsState(this.hotGoodsList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[hotTitle, _wrapGoodsList()],
      ),
    );
  }

  //标题
  Widget hotTitle = Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(8),
    child: Text(
      "火爆专区",
      style: TextStyle(fontSize: 18, color: Colors.redAccent),
    ),
  );

  ///商品列表 UI
  Widget _wrapGoodsList() {
    if (hotGoodsList != null && hotGoodsList.length > 0) {
      List<Widget> wrapList = hotGoodsList.map((item) {
        return Container(
          width: ScreenUtil().setWidth(372),
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(bottom: 3.0),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Image.network(
                item["image"],
                width: ScreenUtil().setWidth(360),
                fit: BoxFit.cover,
              ),
              Text(
                item['name'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(22), color: Colors.pink),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("￥${item['mallPrice']}"),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text(
                    "￥${item['price']}",
                    style: TextStyle(
                        color: Colors.black12,
                        decoration: TextDecoration.lineThrough),
                  )
                ],
              )
            ],
          ),
        );
      }).toList();

      return Wrap(
        spacing: 2,
        children: wrapList,
      );
    } else {
      return Text("暂无火爆数据");
    }
  }
}
