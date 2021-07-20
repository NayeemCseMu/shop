class NewArrivalsModel {
  String? slNo;
  String? productName;
  String? shortDetails;
  String? productDescription;
  int? availableStock;
  int? orderQty;
  int? salesQty;
  int? orderAmount;
  int? salesAmount;
  int? discountPercent;
  int? discountAmount;
  int? unitPrice;
  String? productImage;
  String? sellerName;
  String? sellerProfilePhoto;
  String? sellerCoverPhoto;
  String? ezShopName;
  int? defaultPushScore;
  String? myProductVarId;

  NewArrivalsModel({
    this.slNo,
    this.productName,
    this.shortDetails,
    this.productDescription,
    this.availableStock,
    this.orderQty,
    this.salesQty,
    this.orderAmount,
    this.salesAmount,
    this.discountPercent,
    this.discountAmount,
    this.unitPrice,
    this.productImage,
    this.sellerName,
    this.sellerProfilePhoto,
    this.sellerCoverPhoto,
    this.ezShopName,
    this.defaultPushScore,
    this.myProductVarId,
  });
  NewArrivalsModel.fromJson(Map<String, dynamic> json) {
    slNo = json["slNo"]?.toString();
    productName = json["productName"]?.toString();
    shortDetails = json["shortDetails"]?.toString();
    productDescription = json["productDescription"]?.toString();
    availableStock = json["availableStock"]?.toInt();
    orderQty = json["orderQty"]?.toInt();
    salesQty = json["salesQty"]?.toInt();
    orderAmount = json["orderAmount"]?.toInt();
    salesAmount = json["salesAmount"]?.toInt();
    discountPercent = json["discountPercent"]?.toInt();
    discountAmount = json["discountAmount"]?.toInt();
    unitPrice = json["unitPrice"]?.toInt();
    productImage = json["productImage"]?.toString();
    sellerName = json["sellerName"]?.toString();
    sellerProfilePhoto = json["sellerProfilePhoto"]?.toString();
    sellerCoverPhoto = json["sellerCoverPhoto"]?.toString();
    ezShopName = json["ezShopName"]?.toString();
    defaultPushScore = json["defaultPushScore"]?.toInt();
    myProductVarId = json["myProductVarId"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["slNo"] = slNo;
    data["productName"] = productName;
    data["shortDetails"] = shortDetails;
    data["productDescription"] = productDescription;
    data["availableStock"] = availableStock;
    data["orderQty"] = orderQty;
    data["salesQty"] = salesQty;
    data["orderAmount"] = orderAmount;
    data["salesAmount"] = salesAmount;
    data["discountPercent"] = discountPercent;
    data["discountAmount"] = discountAmount;
    data["unitPrice"] = unitPrice;
    data["productImage"] = productImage;
    data["sellerName"] = sellerName;
    data["sellerProfilePhoto"] = sellerProfilePhoto;
    data["sellerCoverPhoto"] = sellerCoverPhoto;
    data["ezShopName"] = ezShopName;
    data["defaultPushScore"] = defaultPushScore;
    data["myProductVarId"] = myProductVarId;
    return data;
  }
}
