import 'package:banhat/data/services/product_services.dart';
import 'package:banhat/data/models/params_model.dart';
import 'package:banhat/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  // các services của products
  final ProductServices services = ProductServices();

  //State của product
  // Khai báo list danh sách sản Phẩm rx
  RxList<Product> productList = <Product>[].obs;
  RxList<Product> paginateProductList =
      <Product>[].obs; // List sản phẩm này để có kết hợp APi
  //Param để gửi tạo sản phẩm
  var productParams = ParamsModel().obs;

  final formKey = GlobalKey<FormState>();

  //có đang loading hay không
  var isLoading = true.obs;

  bool validate() {
    if (formKey.currentState!.validate()) {
      // Nếu hợp lệ
      return true;
    } else {
      // Nếu có lỗi
      return false;
    }
  }
  
  //Xử lý params thêm xóa sửa dữ liệu trong đó
  //Thêm hình ảnh vào mảng
  void pushImage(String img) {
    if (img.trim().isEmpty) return;

    productParams.update((val) {
      if (val == null) return;

      // Khởi tạo danh sách nếu đang null
      val.images ??= [];

      // Thêm nếu chưa tồn tại
      if (!val.images!.contains(img)) {
        val.images!.add(img);
      }
    });
  }

  //
  void addTitle(String newTitle) {
    productParams.value.title = newTitle;
  }

  void addPrice(double newPrice) {
    productParams.value.price = newPrice;
  }

  void addDesciption(String newDescription) {
    productParams.value.description = newDescription;
  }

  void addCategory(int newCategory) {
    productParams.value.categoryId = newCategory;
  }

  //Lấy danh sách sản phẩm
  void fetchProductList() async {
    productList.value = await services.getProducts();
    isLoading(false);
  }

  //Hàm lấy danh sách đã pagination
  Future<void> fetchPaginatedProductList(int offset, int limit) async {
    if (limit == 0) {
      paginateProductList.value = [];
    }
    
    paginateProductList.value = await services.getPaginatedProduct(
      offset,
      limit,
    );

  }

  //hàm lấy ProductDetail
  Future<Product?> fetchProductById(String id) async {
    Product? product = await services.getProductDetail(id);
    isLoading(false);
    return product;
  }

  //Hàm tạo sản phẩm
  Future createProduct(ParamsModel params) async {
    bool isValid = validate();
    if (isValid == false) {
      return;
    }

    var res = await services.createProduct(params);
    Get.snackbar('Meomeo', res);

    fetchProductList();
  }

  Future deleteProduct(String id) async {
    await services.deleteProduct(id);
    //Lấy lại danh sách sản phẩm
    fetchProductList();
  }

  @override
  void onInit() {
    super.onInit();
    fetchProductList();
  }
}
