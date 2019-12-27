import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopNavigator extends StatelessWidget {
  List navigatorList;

  TopNavigator(this.navigatorList);

  /// 分类导航 item
  Widget _getGridviewItem(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print("点击了。。。");
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item["image"],
            width: ScreenUtil().setHeight(95),
            fit: BoxFit.fill,
          ),
          Text(item["mallCategoryName"]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (navigatorList.length > 10) {
      navigatorList.removeRange(10, navigatorList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navigatorList.map((item) {
          return _getGridviewItem(context, item);
        }).toList(),
      ),
    );
  }
}
