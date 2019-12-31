import 'package:flutter/material.dart';
import 'package:flutter_shop/provide/TestProvide.dart';
import 'package:provide/provide.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentCounter = Provide.value<Counter>(context);

    return Column(children: [
      SizedBox(
        height: 200,
      ),
      Provide<Counter>(
        builder: (context, child, counter) => Text('${counter.value}'),
      ),
      SizedBox(
        height: 100,
      ),
      FlatButton(child: Text('increment'), onPressed: currentCounter.increment),
    ]);
  }
}
