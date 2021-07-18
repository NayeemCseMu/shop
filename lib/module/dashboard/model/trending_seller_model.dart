class TrendingSellerModel {
  String? slNo;
  String? sellerName;
  String? sellerProfilePhoto;
  String? sellerItemPhoto;
  String? ezShopName;
  double? defaultPushScore;
  String? aboutCompany;
  int? allowCOD;
  String? division;
  String? subDivision;
  String? city;
  String? state;
  String? zipCode;
  String? country;
  String? currencyCode;
  int? orderQty;
  int? orderAmount;
  int? salesQty;
  int? salesAmount;
  int? highestDiscountPercent;
  String? lastAddToCart;
  String? lastAddToCartThatSold;

  TrendingSellerModel({
    this.slNo,
    this.sellerName,
    this.sellerProfilePhoto,
    this.sellerItemPhoto,
    this.ezShopName,
    this.defaultPushScore,
    this.aboutCompany,
    this.allowCOD,
    this.division,
    this.subDivision,
    this.city,
    this.state,
    this.zipCode,
    this.country,
    this.currencyCode,
    this.orderQty,
    this.orderAmount,
    this.salesQty,
    this.salesAmount,
    this.highestDiscountPercent,
    this.lastAddToCart,
    this.lastAddToCartThatSold,
  });
  TrendingSellerModel.fromJson(Map<String, dynamic> json) {
    slNo = json["slNo"]?.toString();
    sellerName = json["sellerName"]?.toString();
    sellerProfilePhoto = json["sellerProfilePhoto"]?.toString();
    sellerItemPhoto = json["sellerItemPhoto"]?.toString();
    ezShopName = json["ezShopName"]?.toString();
    defaultPushScore = json["defaultPushScore"]?.toDouble();
    aboutCompany = json["aboutCompany"]?.toString();
    allowCOD = json["allowCOD"]?.toInt();
    division = json["division"]?.toString();
    subDivision = json["subDivision"]?.toString();
    city = json["city"]?.toString();
    state = json["state"]?.toString();
    zipCode = json["zipcode"]?.toString();
    country = json["country"]?.toString();
    currencyCode = json["currencyCode"]?.toString();
    orderQty = json["orderQty"]?.toInt();
    orderAmount = json["orderAmount"]?.toInt();
    salesQty = json["salesQty"]?.toInt();
    salesAmount = json["salesAmount"]?.toInt();
    highestDiscountPercent = json["highestDiscountPercent"]?.toInt();
    lastAddToCart = json["lastAddToCart"]?.toString();
    lastAddToCartThatSold = json["lastAddToCartThatSold"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["slNo"] = slNo;
    data["sellerName"] = sellerName;
    data["sellerProfilePhoto"] = sellerProfilePhoto;
    data["sellerItemPhoto"] = sellerItemPhoto;
    data["ezShopName"] = ezShopName;
    data["defaultPushScore"] = defaultPushScore;
    data["aboutCompany"] = aboutCompany;
    data["allowCOD"] = allowCOD;
    data["division"] = division;
    data["subDivision"] = subDivision;
    data["city"] = city;
    data["state"] = state;
    data["zipcode"] = zipCode;
    data["country"] = country;
    data["currencyCode"] = currencyCode;
    data["orderQty"] = orderQty;
    data["orderAmount"] = orderAmount;
    data["salesQty"] = salesQty;
    data["salesAmount"] = salesAmount;
    data["highestDiscountPercent"] = highestDiscountPercent;
    data["lastAddToCart"] = lastAddToCart;
    data["lastAddToCartThatSold"] = lastAddToCartThatSold;
    return data;
  }
}
