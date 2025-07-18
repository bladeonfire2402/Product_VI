import 'dart:convert';

import 'package:banhat/data/models/product_model.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
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
        final List<dynamic> data = jsonDecode(
          response.body,
        ); // chuyển chuỗi json
        List<Product> products =
            data.map((item) => Product.fromJson(item)).toList();
        print('Thành công');
        return products;
      } else {
        Get.snackbar('Lỗi rồi', 'Không kết nối được');
        return [];
      }
    } catch (e) {
      print(e); //in ra lỗi nếu có
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
}
