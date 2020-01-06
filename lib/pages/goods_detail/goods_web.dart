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
    return Container(
      child: getPageView(context),
    );
  }

  getPageView(context) {
    return Provide.value<GoodsDetailProvider>(context).isLeft
        ? Html(
            data: mGoodsDetail.goodInfo.goodsDetail,
          )
        : Container(
            margin: EdgeInsets.only(bottom: 120),
            width: ScreenUtil().setWidth(750),
            alignment: Alignment.center,
            child: Text("暂时没有评论..."),
          );
  }
}
