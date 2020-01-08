import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/bean/cart_info_bean.dart';
import 'package:flutter_shop/provide/cart_info.dart';
import 'package:provide/provide.dart';

class CartCountWidget extends StatelessWidget {
  CartInfoModel mCartInfo;

  CartCountWidget(this.mCartInfo);

  @override
  Widget build(BuildContext context) {
    return Provide<CartInfoProvider>(builder: (context, child, value) {
      return Container(
        height: ScreenUtil().setHeight(47),
        width: ScreenUtil().setWidth(170),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black12, width: 1)),
        child: Row(
          children: <Widget>[
            _countBtn(context, false),
            _countData(value),
            _countBtn(context, true)
          ],
        ),
      );
    });
  }

  Widget _countBtn(context, bool isAdd) {
    return InkWell(
      onTap: () {
        if (isAdd && mCartInfo.count < 99 || !isAdd && mCartInfo.count > 1) {
          Provide.value<CartInfoProvider>(context)
              .changeCount(mCartInfo.goodsId, isAdd);
        }

        /*if (mCartInfo.count < 99 || mCartInfo.count > 1) {
          Provide.value<CartInfoProvider>(context)
              .changeCount(mCartInfo.goodsId, isAdd);
        }*/
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        child: Text(
          isAdd ? "+" : "-",
          style: TextStyle(
              color: (isAdd && mCartInfo.count < 99 ||
                      !isAdd && mCartInfo.count > 1)
                  ? Colors.black
                  : Colors.black12),
        ),
      ),
    );
  }

  Widget _countData(CartInfoProvider value) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              left: BorderSide(width: 1, color: Colors.black12),
              right: BorderSide(width: 1, color: Colors.black12))),
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(75),
      height: ScreenUtil().setHeight(45),
      child: Text("${mCartInfo.count}"),
    );
  }
}
