import 'package:get/get.dart';
import 'package:shop/module/dashboard/model/new_arrivals_model.dart';
import 'package:shop/module/dashboard/model/new_shops_model.dart';
import 'package:shop/module/dashboard/model/trending_product_model.dart';
import 'package:shop/module/dashboard/model/trending_seller_model.dart';
import 'package:shop/utils/service/api/api_service.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  var trendSellerData = <TrendingSellerModel>[].obs;
  var trendProductData = <TrendingProductModel>[].obs;
  var newArrivalsData = <NewArrivalsModel>[].obs;
  var newShopsData = <NewShopsModel>[].obs;

  Future trendSellerController() async {
    try {
      isLoading(true);
      final result = await ApiService.instance.getTrendingSeller();

      if (result.isNotEmpty) {
        this.trendSellerData.assignAll(result);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future trendProductController() async {
    try {
      isLoading(true);
      final result = await ApiService.instance.getTrendingProduct();

      if (result.isNotEmpty) {
        this.trendProductData.assignAll(result);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future newArrivalController() async {
    try {
      isLoading(true);
      final result = await ApiService.instance.getNewArrivals();

      if (result.isNotEmpty) {
        this.newArrivalsData.assignAll(result);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
  Future newShopController() async {
    try {
      isLoading(true);
      final result = await ApiService.instance.getNewShops();

      if (result.isNotEmpty) {
        this.newShopsData.assignAll(result);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
