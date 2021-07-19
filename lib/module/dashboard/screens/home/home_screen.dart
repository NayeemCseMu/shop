import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/constants/size.dart';
import 'package:shop/module/dashboard/controller/controller.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveSize.init(context);
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => Container(
          height: ResponsiveSize.screenHeight * 0.25,
          margin: EdgeInsets.only(top: 20, left: 20),
          child: productController!.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productController!.trendSellerData.length,
                  itemBuilder: (ctx, index) {
                    final item = productController!.trendSellerData[index];
                    return Container(
                      height: 100,
                      width: 120,
                      margin: EdgeInsets.only(right: 20),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              item.sellerItemPhoto!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 5,
                            left: 5,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage:
                                  NetworkImage(item.sellerProfilePhoto!),
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
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(10)),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              alignment: Alignment.center,
                              child: Text(
                                item.sellerName!,
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
                  }),
        ),
      ),
    );
  }
}
