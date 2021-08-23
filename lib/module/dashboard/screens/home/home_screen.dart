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
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    dataController = Get.find();
    scrollController.addListener(listen);
  }

  listen() {
    if (scrollController.position.pixels > 200) {
      dataController!.isScrolling(true);
    } else {
      dataController!.isScrolling(false);
    }
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
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: AnimatedContainer(
        padding: const EdgeInsets.only(top: 80.0),
        duration: 300.milliseconds,
        curve: Curves.ease,
        child: Obx(() {
          return dataController!.isScrolling.value
              ? FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.deepPurple,
                  onPressed: () {
                    scrollController.animateTo(0,
                        duration: 2.seconds, curve: Curves.ease);
                  },
                  child: Icon(Icons.arrow_upward, size: 20),
                )
              : SizedBox();
        }),
      ),
    );
  }

  Obx _buildBody() {
    return Obx(
      () => RefreshIndicator(
        onRefresh: _getLoad,
        child: SizedBox(
          height: ResponsiveSize.screenHeight,
          child: ListView(
            controller: scrollController,
            padding:
                const EdgeInsets.only(top: 10, bottom: 20, left: 5, right: 5),
            children: [
              TrendingSeller(),
              TrendingProduct(),
              Products(itemCount: 3, startFrom: 0),
              Arrivals(),
              Products(itemCount: 3, startFrom: 3),
              Shops(),
              Products(
                itemCount: dataController!.isLoading.value
                    ? 4
                    : dataController!.productsData.length - 6,
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
