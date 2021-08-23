import 'package:get/get.dart';
import 'package:shop/module/dashboard/controller/data_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataController?>(() => DataController());
  }
}
