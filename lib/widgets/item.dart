import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
      height: 100,
      width: 120,
      margin: EdgeInsets.only(right: 20),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: itemUrl!,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Loading..."),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),

            //   Image.network(
            //     ,
            //     fit: BoxFit.cover,
            //   ),
          ),
          Positioned(
            top: 5,
            left: 5,
            child: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(itemLogo!),
              backgroundColor: Colors.black.withOpacity(0.3),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              child: Text(
                itemName!,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
