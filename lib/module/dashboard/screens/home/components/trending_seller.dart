import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/constants/size.dart';
import 'package:shop/module/dashboard/controller/data_controller.dart';
import 'package:shop/utils/helpers/lazy_loader.dart';
import 'package:shop/widgets/loader_widget.dart';
import '../../../../../widgets/background_card.dart';
import '../../../../../widgets/heading.dart';
import '../../../../../widgets/item.dart';

class TrendingSeller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DataController? dataController = Get.find();
    return BackgroundCard(
      height: ResponsiveSize.screenHeight * 0.25,
      widgetChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingText(text: "Trending Sellers"),
          getVerticalSpace(10),
          if (dataController!.isLoading.value)
            LoaderWidget()
          else
            SizedBox(
              height: ResponsiveSize.screenHeight * 0.2,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dataController.trendSellerData.length,
                  itemBuilder: (ctx, index) {
                    final item = dataController.trendSellerData[index];
                    return Item(
                      itemName: item.sellerName!,
                      itemUrl: item.sellerItemPhoto,
                      itemLogo: item.sellerProfilePhoto,
                    );
                  }),
            ),
        ],
      ),
    );
  }
}
