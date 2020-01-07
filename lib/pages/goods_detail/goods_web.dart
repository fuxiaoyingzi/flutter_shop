import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/bean/goods_detail_bean.dart';
import 'package:flutter_shop/provide/goods_detail.dart';
import 'package:provide/provide.dart';

class GoodsWebPage extends StatelessWidget {
  GoodsDetailData mGoodsDetail;

  GoodsWebPage(this.mGoodsDetail);

  @override
  Widget build(BuildContext context) {
    return Provide<GoodsDetailProvider>(builder: (context, child, value) {
      return Container(
        width: ScreenUtil().setWidth(750),
        margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(110)),
        child: getPageView(context),
      );
    });
  }

  getPageView(context) {
    return Provide.value<GoodsDetailProvider>(context).isLeft
        ? Html(
            data: mGoodsDetail.goodInfo.goodsDetail,
          )
        : Container(
            alignment: Alignment.center,
            child: Text("暂时没有评论..."),
          );
  }
}
