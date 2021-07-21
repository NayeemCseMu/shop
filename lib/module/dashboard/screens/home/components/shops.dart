import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/constants/size.dart';
import 'package:shop/module/dashboard/controller/data_controller.dart';
import 'package:shop/widgets/loader_widget.dart';

import '../../../../../widgets/background_card.dart';
import '../../../../../widgets/heading.dart';
import '../../../../../widgets/item.dart';

class Shops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DataController? dataController = Get.find();
    return BackgroundCard(
      height: ResponsiveSize.screenHeight * 0.25,
      widgetChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingText(text: "New Shops"),
          if (dataController!.isLoading.value)
            LoaderWidget()
          else
            SizedBox(
              height: ResponsiveSize.screenHeight * 0.18,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dataController.newShopsData.length,
                itemBuilder: (ctx, index) {
                  final item = dataController.newShopsData[index];
                  return Item(
                    itemName: item.sellerName!,
                    itemUrl: item.sellerItemPhoto,
                    itemLogo: item.sellerProfilePhoto,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
