class ProductsModel {
  String? storyTime;
  String? story;
  String? storyType;
  String? storyImage;
  String? storyAdditionalImages;
  String? promoImage;
  int? orderQty;
  String? lastAddToCart;
  int? availableStock;
  String? myId;
  String? ezShopName;
  String? companyName;
  String? companyLogo;
  String? companyEmail;
  String? currencyCode;
  int? unitPrice;
  int? discountAmount;
  int? discountPercent;
  String? iMyID;
  String? shopName;
  String? shopLogo;
  String? shopLink;
  String? friendlyTimeDiff;
  String? slNo;

  ProductsModel({
    this.storyTime,
    this.story,
    this.storyType,
    this.storyImage,
    this.storyAdditionalImages,
    this.promoImage,
    this.orderQty,
    this.lastAddToCart,
    this.availableStock,
    this.myId,
    this.ezShopName,
    this.companyName,
    this.companyLogo,
    this.companyEmail,
    this.currencyCode,
    this.unitPrice,
    this.discountAmount,
    this.discountPercent,
    this.iMyID,
    this.shopName,
    this.shopLogo,
    this.shopLink,
    this.friendlyTimeDiff,
    this.slNo,
  });
  ProductsModel.fromJson(Map<String, dynamic> json) {
    storyTime = json["storyTime"]?.toString();
    story = json["story"]?.toString();
    storyType = json["storyType"]?.toString();
    storyImage = json["storyImage"]?.toString();
    storyAdditionalImages = json["storyAdditionalImages"]?.toString();
    promoImage = json["promoImage"]?.toString();
    orderQty = json["orderQty"]?.toInt();
    lastAddToCart = json["lastAddToCart"]?.toString();
    availableStock = json["availableStock"]?.toInt();
    myId = json["myId"]?.toString();
    ezShopName = json["ezShopName"]?.toString();
    companyName = json["companyName"]?.toString();
    companyLogo = json["companyLogo"]?.toString();
    companyEmail = json["companyEmail"]?.toString();
    currencyCode = json["currencyCode"]?.toString();
    unitPrice = json["unitPrice"]?.toInt();
    discountAmount = json["discountAmount"]?.toInt();
    discountPercent = json["discountPercent"]?.toInt();
    iMyID = json["iMyID"]?.toString();
    shopName = json["shopName"]?.toString();
    shopLogo = json["shopLogo"]?.toString();
    shopLink = json["shopLink"]?.toString();
    friendlyTimeDiff = json["friendlyTimeDiff"]?.toString();
    slNo = json["slNo"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["storyTime"] = storyTime;
    data["story"] = story;
    data["storyType"] = storyType;
    data["storyImage"] = storyImage;
    data["storyAdditionalImages"] = storyAdditionalImages;
    data["promoImage"] = promoImage;
    data["orderQty"] = orderQty;
    data["lastAddToCart"] = lastAddToCart;
    data["availableStock"] = availableStock;
    data["myId"] = myId;
    data["ezShopName"] = ezShopName;
    data["companyName"] = companyName;
    data["companyLogo"] = companyLogo;
    data["companyEmail"] = companyEmail;
    data["currencyCode"] = currencyCode;
    data["unitPrice"] = unitPrice;
    data["discountAmount"] = discountAmount;
    data["discountPercent"] = discountPercent;
    data["iMyID"] = iMyID;
    data["shopName"] = shopName;
    data["shopLogo"] = shopLogo;
    data["shopLink"] = shopLink;
    data["friendlyTimeDiff"] = friendlyTimeDiff;
    data["slNo"] = slNo;
    return data;
  }
}
