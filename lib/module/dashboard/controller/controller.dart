import 'package:get/get.dart';
import 'package:shop/module/dashboard/model/trending_seller_model.dart';
import 'package:shop/utils/service/api/api_service.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  var trendSellerData = <TrendingSellerModel>[].obs;

  Future trendSellerController() async {
    try {
      isLoading(true);
      final result = await ApiService.instance.getTrendingSeller();
      print("--------------");
      print(result);
      if (result.isNotEmpty) {
        this.trendSellerData.assignAll(result);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
