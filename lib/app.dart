import 'package:banhat/bindings/product_bindings.dart';
import 'package:banhat/page/productPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/product',
      getPages: [
        GetPage(
          name: '/product',
          page: () => Productpage(),  // ✅ truyền trực tiếp
          binding: ProductBinding(),  // 👈 nếu cần controller
        ),
      ],
    );
  }
}