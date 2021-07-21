import 'package:get/get.dart';
import 'package:shop/module/dashboard/controller/base_controller.dart';
import 'package:shop/module/dashboard/model/new_arrivals_model.dart';
import 'package:shop/module/dashboard/model/new_shops_model.dart';
import 'package:shop/module/dashboard/model/products_model.dart';
import 'package:shop/module/dashboard/model/trending_product_model.dart';
import 'package:shop/module/dashboard/model/trending_seller_model.dart';
import 'package:shop/utils/service/api/api_service.dart';

class DataController extends GetxController with BaseController {
  var isLoading = false.obs;
  var noInternet = false.obs;
  var trendSellerData = <TrendingSellerModel>[].obs;
  var trendProductData = <TrendingProductModel>[].obs;
  var newArrivalsData = <NewArrivalsModel>[].obs;
  var newShopsData = <NewShopsModel>[].obs;
  var productsData = <ProductsModel>[].obs;

//CONTROLLER TRENDING SELLER
  Future trendSellerController() async {
    try {
      noInternet(false);
      isLoading(true);
      final result = await ApiService.instance.getTrendingSeller();

      if (result.isNotEmpty) {
        this.trendSellerData.assignAll(result);
      }
    } catch (e) {
      noInternet(true);
      handleError(e);
    } finally {
      isLoading(false);
    }
  }

//CONTROLLER TRENDING PRODUCTS
  Future trendProductController() async {
    try {
      isLoading(true);
      final result = await ApiService.instance.getTrendingProduct();

      if (result.isNotEmpty) {
        this.trendProductData.assignAll(result);
      }
    } catch (e) {
      handleError(e);
    } finally {
      isLoading(false);
    }
  }

//CONTROLLER NEW ARRIVALS
  Future newArrivalController() async {
    try {
      isLoading(true);
      final result = await ApiService.instance.getNewArrivals();

      if (result.isNotEmpty) {
        this.newArrivalsData.assignAll(result);
      }
    } catch (e) {
      handleError(e);
    } finally {
      isLoading(false);
    }
  }

//CONTROLLER NEW SHOP
  Future newShopController() async {
    try {
      isLoading(true);
      final result = await ApiService.instance.getNewShops();

      if (result.isNotEmpty) {
        this.newShopsData.assignAll(result);
      }
    } catch (e) {
      handleError(e);
    } finally {
      isLoading(false);
    }
  }

//CONTROLLER PRODUCTS
  Future productsController() async {
    try {
      isLoading(true);
      final result = await ApiService.instance.getProducts();

      if (result.isNotEmpty) {
        this.productsData.assignAll(result);
      }
    } catch (e) {
      handleError(e);
    } finally {
      isLoading(false);
    }
  }
}
