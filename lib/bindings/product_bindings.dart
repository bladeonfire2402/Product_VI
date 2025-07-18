import 'package:banhat/controller/product_controller.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/utils.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
