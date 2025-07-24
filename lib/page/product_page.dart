import 'package:banhat/controller/product_controller.dart';
import 'package:banhat/widgets/product_card/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Productpage extends StatelessWidget {
  const Productpage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());

    return SafeArea(
      child: SingleChildScrollView(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Padding(
              padding: const EdgeInsets.only(top: 100),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children:
                  controller.productList
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ProductCard(product: item),
                        ),
                      )
                      .toList(),
            ),
          );
        }),
      ),
    );
  }
}
