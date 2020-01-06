import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/bean/goods_detail_bean.dart';

///商品详情 顶部UI
class GoodsDetailTopArea extends StatelessWidget {
  GoodsDetailData mGoodsDetailData;

  GoodsDetailTopArea(this.mGoodsDetailData);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _getGoodsImg(),
          _getGoodsTitle(),
          _getGoodsNum(),
          _getPrice(),
          _getEnsure(),
        ],
      ),
    );
  }

  ///图片
  Widget _getGoodsImg() {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      child: Image.network(
        mGoodsDetailData.goodInfo.image1,
        fit: BoxFit.cover,
      ),
    );
  }

  ///商品名称
  Widget _getGoodsTitle() {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.only(left: 15),
      child: Text(
        mGoodsDetailData.goodInfo.goodsName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  ///商品编号
  Widget _getGoodsNum() {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.only(left: 15, top: 5),
      child: Text(
        "编号：${mGoodsDetailData.goodInfo.goodsSerialNumber}",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
      ),
    );
  }

  ///商品价格
  Widget _getPrice() {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      padding: EdgeInsets.only(top: 5, left: 15),
      child: Row(
        children: <Widget>[
          Text(
            "￥${mGoodsDetailData.goodInfo.presentPrice}",
            style: TextStyle(color: Colors.deepOrangeAccent),
          ),
          SizedBox(
            width: 20,
          ),
          Text("市场价： "),
          Text(
            "￥${mGoodsDetailData.goodInfo.oriPrice}",
            style: TextStyle(
                color: Colors.grey, decoration: TextDecoration.lineThrough),
          )
        ],
      ),
    );
  }

  ///说明
  Widget _getEnsure() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
      color: Colors.white,
      child: Text(
        "说明：>急速送达>正品保障",
        style: TextStyle(color: Colors.deepOrangeAccent),
      ),
    );
  }
}
