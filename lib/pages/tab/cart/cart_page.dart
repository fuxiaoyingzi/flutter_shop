import 'package:flutter/material.dart';
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
            var cartInfoList =
                Provide.value<CartInfoProvider>(context).cartInfoList;
            return ListView.builder(
              itemBuilder: (context, index) {
                return CartListItemWidget(cartInfoList[index]);
              },
              itemCount: cartInfoList.length,
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
