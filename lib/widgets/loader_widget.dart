import 'package:flutter/material.dart';
import 'package:shop/constants/size.dart';
import 'package:shop/utils/helpers/lazy_loader.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveSize.screenHeight * 0.18,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (ctx, index) {
          return Container(
            margin: EdgeInsets.only(right: 5,left: 10),
            child: LazyLoading(
              width: 100,
              height: 64,
            ),
          );
        },
      ),
    );
  }
}

class ProductLazyLoader extends StatelessWidget {
  const ProductLazyLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              child: LazyLoading(
                width: 60,
                height: 60,
              ),
            ),
            title: LazyLoading(
              height: 20,
              width: 200,
            ),
            subtitle: LazyLoading(
              height: 10,
              width: 100,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: LazyLoading(
              width: double.infinity,
              height: ResponsiveSize.screenHeight * 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
