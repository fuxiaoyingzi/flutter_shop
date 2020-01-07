import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/tab/cart/cart_bottom.dart';
import 'package:flutter_shop/provide/cart_info.dart';
import 'package:provide/provide.dart';

import 'cart_list_item.dart';

///购物车
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Provide<CartInfoProvider>(builder: (context, child, value) {
                    var cartInfoList = Provide.value<CartInfoProvider>(context).cartInfoList;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return CartListItemWidget(cartInfoList[index]);
                      },
                      itemCount: cartInfoList.length,
                    );
                  }),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(flex: 0, child: CartBottomWidget())
              ],
            );
          } else {
            return Text("正在加载...");
          }
        },
        future: _getCartList(context),
      ),
    );
  }

  Future<String> _getCartList(context) async {
    await Provide.value<CartInfoProvider>(context).getCartList();
    return "ending";
  }
}
