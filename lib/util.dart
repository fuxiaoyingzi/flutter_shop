import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

void showToast(String msg, BuildContext context, {int duration, int gravity}) {
  Toast.show(msg, context);
}

//复制数据
void copyData(String data) {
  var clipboard = ClipboardData(text: data);
  Clipboard.setData(clipboard);
}
