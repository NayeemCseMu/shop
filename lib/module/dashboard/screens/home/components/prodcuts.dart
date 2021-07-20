import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/constants/size.dart';
import 'package:shop/module/dashboard/controller/data_controller.dart';

import '../../../../../widgets/background_card.dart';

class Products extends StatelessWidget {
  const Products({
    Key? key,
    @required this.itemCount,
    @required this.startFrom,
  }) : super(key: key);
  final int? itemCount;
  final int? startFrom;

  @override
  Widget build(BuildContext context) {
    DataController? productController = Get.find();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        itemCount!,
        (index) {
          int itemIndex = startFrom! + index;
          final item = productController!.productsData[itemIndex];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: BackgroundCard(
              height: ResponsiveSize.screenHeight * 0.45,
              widgetChild: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(item.companyLogo!),
                    ),
                    title: Text(item.companyName!),
                    subtitle: Text(item.friendlyTimeDiff!),
                  ),
                  Text(item.story!),
                  getVerticalSpace(10),
                  SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: CachedNetworkImage(
                      imageUrl: item.storyImage!,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: Text("Loading..."),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  getVerticalSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${item.unitPrice}"),
                      Text("${item.availableStock} Available Stock"),
                      Text("${item.orderQty} Order(s)"),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Expanded(
//       child: ListView.builder(
//         itemCount: 3,
//         itemBuilder: (ctx, index) {
//           return Container(
//             height: ResponsiveSize.screenHeight * 0.45,
//             margin: EdgeInsets.only(bottom: 10),
//             color: Colors.teal,
//           );
//         },
//       ),
//     );