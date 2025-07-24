import 'package:banhat/controller/product_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsPage extends StatelessWidget {
  final String id; // Truyền vào id để biết fetch sản phẩm nào
  const ProductDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final ProductController c = Get.put(ProductController());
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: FutureBuilder(
          future: c.fetchProductById(id),
          builder: (context, snapshot) {
            //context là ngữ cảnh
            // snapshot là cái data khi mà fetch về
            //Bắt lỗi các trường hợp
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Lỗi: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: Text("Không tìm thấy sản phẩm"));
            }

            // Nếu không có lỗi set Product Model = data fetch về
            final Product = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: screenWidth,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network(
                        Product.images![0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Row(
                          spacing: 20,
                          children:
                              Product.images!
                                  .map(
                                    (img) => Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(img),
                                      ),
                                    ),
                                  )
                                  .toList(),
                        ),
                        SizedBox(height: 20),
                        Text(
                          Product.title ?? "",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            color: Colors.blue,
                            fontSize: 28,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price: ${Product.price.toString()}",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.blue,
                                decoration: TextDecoration.none,
                              ),
                            ),

                            Text(
                              "Category: ${Product.category!.name}",
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.blue,
                                decoration: TextDecoration.none,
                              ),
                            ),

                            Text(
                              "Description: ${Product.description}",
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                decoration: TextDecoration.none,
                              ),
                            ),

                            Text(
                              "CategoryId: ${Product.category!.id}",
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            SizedBox(height: 20),

                            SizedBox(
                              width: screenWidth - 20,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  c.deleteProduct(id);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Xóa ${id}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
