import 'package:banhat/data/models/product_model.dart';
import 'package:banhat/data/services/product_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  // các services của products
  final ProductServices services = ProductServices();
  // Khai báo list danh sách sản Phẩm rx
  RxList<Product> productList = <Product>[].obs;
  //có đang loading hay không
  var isLoading = true.obs;

  void fetchProductList() async {
    productList.value =  await services.getProducts();
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    fetchProductList();
  }
}
