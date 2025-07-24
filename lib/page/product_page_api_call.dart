import 'package:banhat/controller/product_controller.dart';
import 'package:banhat/widgets/custom_input/custom_input.dart';
import 'package:banhat/widgets/product_card/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPageApiCall extends StatelessWidget {
  const ProductPageApiCall({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController lmtCtr = TextEditingController();
    final ProductController c = Get.put(ProductController());
    final double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CustomInput(
              textEditingController: lmtCtr,
              textInputType: TextInputType.number,
              hintText: "Limit",
              labelText: "Nhập số lượng sản phẩm xem ",
              icon: Icons.accessibility_new_rounded,
            ),
            SizedBox(height: 10),
            Container(
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  c.fetchPaginatedProductList(
                    0,
                    int.parse(lmtCtr.text == "" ? "0" : lmtCtr.text),
                  );
                },
                child: Text("Refresh", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 10,),
            Obx(
              () => Column(
                spacing: 10,
                children:
                    c.paginateProductList.value
                        .map((e) => ProductCard(product: e))
                        .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
