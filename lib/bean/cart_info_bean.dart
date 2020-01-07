class CartInfoModel {
  String goodsId;
  String goodsName;
  double goodsPrice;
  String goodsImg;
  int count;
  bool isCheck;

  CartInfoModel(
      {this.goodsId,
      this.goodsName,
      this.goodsPrice,
      this.goodsImg,
      this.count,
      this.isCheck});

  CartInfoModel.fromJson(Map<String, dynamic> json) {
    goodsId = json['goodsId'];
    goodsName = json['goodsName'];
    goodsPrice = json['goodsPrice'];
    goodsImg = json['goodsImg'];
    count = json['count'];
    isCheck = json['isCheck'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsId'] = this.goodsId;
    data['goodsName'] = this.goodsName;
    data['goodsPrice'] = this.goodsPrice;
    data['goodsImg'] = this.goodsImg;
    data['count'] = this.count;
    data['isCheck'] = this.isCheck;
    return data;
  }
}
