import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop/constants/size.dart';
import 'package:shop/utils/helpers/lazy_loader.dart';

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.itemName,
    required this.itemUrl,
    required this.itemLogo,
  }) : super(key: key);

  final String? itemName;
  final String? itemUrl;
  final String? itemLogo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreeWidth(100),
      margin: EdgeInsets.only(left: 10, bottom: 5, right: 10),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: itemUrl!,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  LazyLoading(
                height: 100,
                width: getScreeWidth(100),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
            child: CachedNetworkImage(
              imageUrl: itemLogo!,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 15,
                backgroundImage: imageProvider,
                backgroundColor: Colors.transparent,
              ),
              placeholder: (context, url) =>
                  CircleAvatar(radius: 15, backgroundColor: Colors.transparent),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // height: 35,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text(
                itemName!,
                maxLines: 3,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(fontSize: getTextSize(14), color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
