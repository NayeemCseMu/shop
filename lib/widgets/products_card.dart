import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop/constants/size.dart';
import 'package:shop/utils/helpers/lazy_loader.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.itemName,
    required this.itemUrl,
    required this.shortDetails,
  }) : super(key: key);

  final String? itemName;
  final String? itemUrl;
  final String? shortDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreeWidth(100),
      decoration: itemBoxDecoration(),
      margin: EdgeInsets.only(left: 10, bottom: 5, right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: getScreenHeight(80),
            width: getScreeWidth(100),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: CachedNetworkImage(
                imageUrl: itemUrl!,
                height: 100,width: 100,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, _) =>
                    LazyLoading(
                  height: 100,
                  width: getScreeWidth(100),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          getVerticalSpace(10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  itemName!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: getTextSize(12),
                  ),
                ),
                getVerticalSpace(2),
                FittedBox(
                  child: Text(
                    shortDetails!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getTextSize(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration itemBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 4),
          blurRadius: 4,
          color: Colors.black.withOpacity(0.25),
        )
      ],
    );
  }
}
