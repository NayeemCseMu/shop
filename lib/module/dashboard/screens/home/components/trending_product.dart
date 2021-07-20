import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/constants/size.dart';
import 'package:shop/module/dashboard/controller/data_controller.dart';
import 'package:shop/widgets/heading.dart';
import 'package:shop/widgets/products_card.dart';

import '../../../../../widgets/background_card.dart';

class TrendingProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DataController? productController = Get.find();
    return BackgroundCard(
      height: ResponsiveSize.screenHeight * 0.3,
      widgetChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingText(text: "Trending Products"),
          getVerticalSpace(20),
          SizedBox(
            height: ResponsiveSize.screenHeight * 0.2,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (ctx, index) {
                  final item = productController!.trendProductData[index];
                  return ProductCard(
                    itemName: item.productName!,
                    itemUrl: item.productImage,
                    shortDetails: item.shortDetails,
                  );
                }),
          ),
        
        ],
      ),
    );
  }
}
