class CartInfoModel {
  String goodsId;
  String goodsName;
  double goodsPrice;
  String goodsImg;
  int count;

  CartInfoModel(
      {this.goodsId,
      this.goodsName,
      this.goodsPrice,
      this.goodsImg,
      this.count});

  CartInfoModel.fromJson(Map<String, dynamic> json) {
    goodsId = json['goodsId'];
    goodsName = json['goodsName'];
    goodsPrice = json['goodsPrice'];
    goodsImg = json['goodsImg'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsId'] = this.goodsId;
    data['goodsName'] = this.goodsName;
    data['goodsPrice'] = this.goodsPrice;
    data['goodsImg'] = this.goodsImg;
    data['count'] = this.count;
    return data;
  }
}
