import 'package:banhat/controller/app_bar_controller.dart';
import 'package:banhat/controller/bottom_nav_controller.dart';
import 'package:banhat/page/product_create_page.dart';
import 'package:banhat/page/product_page.dart';
import 'package:banhat/page/product_page_api_call.dart';
import 'package:banhat/widgets/bottom_nav/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootLayout extends StatefulWidget {
  const RootLayout({super.key});

  @override
  State<RootLayout> createState() => _RootLayoutState();
}

class _RootLayoutState extends State<RootLayout> {
  final AppBarController a = Get.put(AppBarController());
  final BottomNavController b = Get.put(BottomNavController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Obx(
          () => Text(a.title.value, style: TextStyle(color: Colors.white)),
        ),
        shadowColor: Colors.blue,
      ),
      body: Obx(() {
        switch (b.page) {
          case 0:
            return Productpage();
          case 1:
            return ProductCreatePage();
          case 2:
            return ProductPageApiCall();
          default:
            return Productpage();
        }
      }),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
