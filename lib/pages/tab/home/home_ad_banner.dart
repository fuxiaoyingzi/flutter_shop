import 'package:flutter/material.dart';

// 首页广告图
class AdBanner extends StatelessWidget {
  String adImgUrl;

  AdBanner(this.adImgUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.0),
      child: Image.network(
        adImgUrl,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
