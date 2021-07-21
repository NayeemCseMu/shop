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
  late DataController? dataController;

  @override
  void initState() {
    super.initState();
    dataController = Get.put(DataController());
    _getLoad();
  }

  Future _getLoad() async {
    await dataController!.trendSellerController();
    await dataController!.trendProductController();
    await dataController!.newArrivalController();
    await dataController!.newShopController();
    await dataController!.productsController();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveSize.init(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Obx _buildBody() {
    return Obx(
      () => RefreshIndicator(
        onRefresh: _getLoad,
        child: SizedBox(
          height: ResponsiveSize.screenHeight,
          child: ListView(
            padding: const EdgeInsets.only(top: 10, bottom: 20, left: 5),
            children: [
              TrendingSeller(),
              TrendingProduct(),
              Products(itemCount: 3, startFrom: 0),
              Arrivals(),
              Products(itemCount: 3, startFrom: 3),
              Shops(),
              Products(
                itemCount: 
                dataController!.isLoading.value
                    ? 4
                    : dataController!.productsData.length - 6 ,
                startFrom: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      title: Text(
        "Home",
        style: TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
      ),
    );
  }
}
