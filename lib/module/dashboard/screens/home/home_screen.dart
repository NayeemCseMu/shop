import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/constants/size.dart';
import 'package:shop/module/dashboard/controller/data_controller.dart';
import 'package:shop/module/dashboard/screens/home/components/arrivals.dart';
import 'package:shop/module/dashboard/screens/home/components/prodcuts.dart';
import 'package:shop/module/dashboard/screens/home/components/shops.dart';
import 'package:shop/module/dashboard/screens/home/components/trending_product.dart';
import 'package:shop/module/dashboard/screens/home/components/trending_seller.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DataController? productController;

  @override
  void initState() {
    super.initState();
    productController = Get.put(DataController());
    _getLoad();
  }

  Future _getLoad() async {
    await productController!.trendSellerController();
    await productController!.trendProductController();
    await productController!.newArrivalController();
    await productController!.newShopController();
    await productController!.productsController();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveSize.init(context);
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => SizedBox(
          height: ResponsiveSize.screenHeight,
          child: productController!.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  padding: const EdgeInsets.only(top: 10, bottom: 20, left: 5),
                  children: [
                    TrendingSeller(),
                    TrendingProduct(),
                    Products(itemCount: 3, startFrom: 0),
                    getVerticalSpace(5),
                    Arrivals(),
                    getVerticalSpace(10),
                    Products(itemCount: 3, startFrom: 3),
                    getVerticalSpace(5),
                    Shops(),
                    getVerticalSpace(10),
                    Products(
                      itemCount: productController!.productsData.length - 6,
                      startFrom: 6,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
