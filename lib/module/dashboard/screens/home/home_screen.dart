import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/constants/size.dart';
import 'package:shop/module/dashboard/controller/controller.dart';
import 'package:shop/widgets/arrivals.dart';
import 'package:shop/widgets/heading.dart';
import 'package:shop/widgets/shops.dart';
import 'package:shop/widgets/trending_product.dart';
import 'package:shop/widgets/trending_seller.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductController? productController;

  @override
  void initState() {
    super.initState();
    productController = Get.put(ProductController());
    _getLoad();
  }

  Future _getLoad() async {
    await productController!.trendSellerController();
    await productController!.trendProductController();
    await productController!.newArrivalController();
    await productController!.newShopController();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveSize.init(context);
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => Container(
          height: ResponsiveSize.screenHeight,
          margin: EdgeInsets.only(top: 10, left: 10),
          child: productController!.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  padding: EdgeInsets.only(bottom: 20),
                  children: [
                    HeadingText(text: "Trending Sellers"),
                    getVerticalSpace(10),
                    TrendingSeller(),
                    getVerticalSpace(20),
                    HeadingText(text: "Trending Products"),
                    getVerticalSpace(10),
                    TrendingProduct(),
                    getVerticalSpace(20),
                    HeadingText(text: "New Arrivals"),
                    getVerticalSpace(10),
                    Arrivals(),
                    getVerticalSpace(20),
                    HeadingText(text: "New Shps"),
                    getVerticalSpace(10),
                    Shops(),
                  ],
                ),
        ),
      ),
    );
  }
}
