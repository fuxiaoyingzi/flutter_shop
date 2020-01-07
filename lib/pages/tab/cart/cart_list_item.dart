import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/bean/cart_info_bean.dart';

class CartListItemWidget extends StatelessWidget {
  CartInfoModel mCartInfo;

  CartListItemWidget(this.mCartInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.black12)),
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      padding: EdgeInsets.fromLTRB(0, 10, 5, 10),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          _getCheckIcon(),
          _getImge(),
          _getGoodsName(),
          _getGoodsPrice()
        ],
      ),
    );
  }

  //选中与否
  Widget _getCheckIcon() {
    return Expanded(
        child: Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Checkbox(
        value: true,
        onChanged: (val) {},
        activeColor: Colors.pinkAccent,
      ),
    ));
  }

  //商品图片
  Widget _getImge() {
    return Expanded(
        child: Container(
      width: ScreenUtil().setWidth(150),
      height: ScreenUtil().setHeight(150),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      child: Image.network(
        mCartInfo.goodsImg,
        fit: BoxFit.cover,
      ),
    ));
  }

  //选中与否
  Widget _getGoodsName() {
    return Expanded(
        flex: 2,
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
            children: <Widget>[
              Text(
                "${mCartInfo.goodsName}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ));
  }

  //选中与否
  Widget _getGoodsPrice() {
    return Expanded(
        child: Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "￥${mCartInfo.goodsPrice}",
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "￥${mCartInfo.goodsPrice}",
            style: TextStyle(
                decoration: TextDecoration.lineThrough, color: Colors.black26),
          ),
          SizedBox(
            height: 10,
          ),
          Icon(
            Icons.delete,
            color: Colors.blue,
            size: 30,
          )
        ],
      ),
    ));
  }
}
