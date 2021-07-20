import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/constants/size.dart';
import 'package:shop/module/dashboard/controller/data_controller.dart';
import 'package:shop/utils/helpers/lazy_loader.dart';
import 'package:shop/widgets/loader_widget.dart';
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
    DataController? cardController = Get.find();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: cardController!.isLoading.value
          ? List.generate(
              itemCount!,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: BackgroundCard(
                  height: ResponsiveSize.screenHeight * 0.4,
                  
                  widgetChild: ProductLazyLoader(),
                ),
              ),
            )
          : List.generate(
              itemCount!,
              (index) {
                int itemIndex = startFrom! + index;
                final item = cardController.productsData[itemIndex];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: BackgroundCard(
                    height: ResponsiveSize.screenHeight * 0.4,
                    widgetChild: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CachedNetworkImage(
                              imageUrl: item.companyLogo!,
                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
                                // radius: 15,
                                backgroundImage: imageProvider,
                                backgroundColor: Colors.black.withOpacity(0.3),
                              ),
                              placeholder: (context, url) => CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.transparent),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            title: Text(item.companyName!),
                            subtitle: Text(item.friendlyTimeDiff!),
                          ),
                          Text(item.story!),
                          getVerticalSpace(10),
                          SizedBox(
                            width: double.infinity,
                            height: getScreenHeight(150),
                            child: CachedNetworkImage(
                              imageUrl: item.storyImage!,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      LazyLoading(
                                width: double.infinity,
                                height: 200,
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          getVerticalSpace(20),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              cardBottom(
                                  text: "${item.currencyCode} ${item.unitPrice}"
                                      .toUpperCase(),
                                  icon: Icons.money),
                              cardBottom(
                                  text:
                                      "${item.availableStock} Available Stock",
                                  icon: Icons.menu),
                              cardBottom(
                                  text: "${item.orderQty} Order(s)",
                                  icon: Icons.production_quantity_limits),
                            ],
                          ),
                          getVerticalSpace(10)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  Row cardBottom({@required text, @required icon}) => Row(
        children: [
          Icon(
            icon,
            size: 20,
          ),
          getHorizontalSpace(5),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: getTextSize(12),
            ),
          ),
        ],
      );
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