import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// 店铺信息
// ignore: must_be_immutable
class StoreInfo extends StatelessWidget {
  String leaderImage;

  String leaderPhone;

  StoreInfo(this.leaderImage, this.leaderPhone);

  _launchURL() async {
    String url = "tel:+" + leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '数据异常 $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(3.0),
        child: InkWell(
          onTap: _launchURL,
          child: Image.network(
            leaderImage,
            fit: BoxFit.fitWidth,
          ),
        ));
  }
}
