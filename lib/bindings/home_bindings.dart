import 'package:get/instance_manager.dart';
import 'package:thirumathikart_seller/controllers/home_controller.dart';
import 'package:thirumathikart_seller/controllers/orders_controller.dart';
import 'package:thirumathikart_seller/controllers/product_controller.dart';
import 'package:thirumathikart_seller/controllers/profile_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(ProductController());
    Get.put(ProfileController());
    Get.put(OrdersController());
  }
}
