import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void showToast(String msg, BuildContext context, {int duration, int gravity}) {
  Toast.show(msg, context);
}
