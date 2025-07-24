import 'dart:convert';
import 'package:banhat/data/models/params_model.dart';
import 'package:banhat/data/models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  //Call Api phải dùng future
  // Gọi lấy danh sách sản phẩm GET
  Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(
        Uri.parse("https://api.escuelajs.co/api/v1/products"),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        // chuyển chuỗi json
        List<Product> products =
            data.map((item) => Product.fromJson(item)).toList();

        return products;
      } else {
        Get.snackbar('Lỗi rồi', 'Không kết nối được');
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  //Lấy danh sách sản phẩm phân trang
  Future<List<Product>> getPaginatedProduct(int offset, int limit) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.escuelajs.co/api/v1/products?offset=${offset}&limit=${limit}',
        ),
      );

      List<Product> products = [];
      
      // Nếu thông báo thành công
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(
          response.body,
        ); // chuyển chuỗi json
        products = data.map((item) => Product.fromJson(item)).toList();
        Get.snackbar("Thành công", "Lấy danh sách sản phẩm thành công");
      }

      return products;
    } catch (e) {
      Get.snackbar("", "Lỗi lấy danh sách sản phẩm");
      return [];
    }
  }

  //chi tiết sản phẩm GET
  Future<Product?> getProductDetail(productId) async {
    try {
      final response = await http.get(
        Uri.parse("https://api.escuelajs.co/api/v1/products/${productId}"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body); // chuyển chuỗi json
        Product product = Product.fromJson(data);
        print('Thành công');
        return product;
      } else {
        Get.snackbar('Lỗi rồi', 'Không kết nối được');
        return null;
      }
    } catch (e) {
      print(e); //in ra lỗi nếu có
      return null;
    }
  }

  Future<String> createProduct(ParamsModel param) async {
    try {
      final res = await http.post(
        Uri.parse('https://api.escuelajs.co/api/v1/products'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(param.toJson()),
      );

      print(res.body); // gửi request POST

      return 'tạo sản phẩm thành công';
    } catch (e) {
      print(e);
      return "Lỗi rồi meomeo";
    }
  }

  Future deleteProduct(String id) async {
    try {
      final res = await http.delete(
        Uri.parse('https://api.escuelajs.co/api/v1/products/${id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (res.statusCode == 200) {
        Get.snackbar("Thành công", "Đã xóa sản phẩm id ${id}");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Lỗi rồi", "Xóa sản phẩm lỗi");
    }
  }
}
