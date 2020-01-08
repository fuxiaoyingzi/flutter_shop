import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///个人中心 信息模块
class MineInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(500),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578473852219&di=f6d87f7a67a3ac733a67f9bc5169543a&imgtype=0&src=http%3A%2F%2Fpic92.nipic.com%2Ffile%2F20160317%2F5469052_122914537517_2.jpg"),
            fit: BoxFit.cover),
      ),
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(220)),
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Image.network(
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578473427017&di=4af738f37b9f582e7c4dd667a1b8fe7f&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201804%2F05%2F20180405231200_exhbj.jpg",
              fit: BoxFit.cover,
              width: 60,
              height: 60,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "付小影子",
            style: TextStyle(color: Colors.white, fontSize: 22),
          )
        ],
      ),
    );
  }
}
