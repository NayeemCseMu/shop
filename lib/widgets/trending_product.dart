import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/constants/size.dart';
import 'package:shop/module/dashboard/controller/controller.dart';

import 'item.dart';

class TrendingProduct extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    ProductController? productController = Get.find();
    return Container(
      height: ResponsiveSize.screenHeight * 0.25,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (ctx, index) {
            final item =
                productController!.trendProductData[index];
            return Item(
              itemName: item.sellerName!,
              itemUrl: item.productImage,
              itemLogo: item.sellerProfilePhoto,
            );
          }),
    );
  }
}