import 'package:banhat/controller/product_controller.dart';
import 'package:banhat/widgets/custom_input/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCreatePage extends StatelessWidget {
  const ProductCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController desCtr = TextEditingController();
    TextEditingController cateCtr = TextEditingController();
    TextEditingController titleCtr = TextEditingController();
    TextEditingController priceCtr = TextEditingController();
    TextEditingController imgCtr = TextEditingController();

    ProductController c = Get.put(ProductController());

    final double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: c.formKey,
            child: Column(
              children: [
                Text(
                  "Create Product Form",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.pacifico(
                    color: Colors.blue,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                CustomInput(
                  onChangefn: (value) {
                    c.addTitle(titleCtr.text);
                  },
                  textEditingController: titleCtr,
                  textInputType: TextInputType.text,
                  hintText: "Nhập tên sản phẩm",
                  labelText: "Tên ",
                  icon: Icons.tab,
                ),
                SizedBox(height: 10),
                CustomInput(
                  onChangefn: (v) {
                    c.addPrice(double.parse(priceCtr.text));
                  },
                  textEditingController: priceCtr,
                  textInputType: TextInputType.number,
                  hintText: "Nhập tiền sản phẩm",
                  labelText: "Giá",
                  icon: Icons.attach_money_outlined,
                ),
                SizedBox(height: 10),
                CustomInput(
                  onChangefn: (v) {
                    c.addDesciption(desCtr.text);
                  },
                  textEditingController: desCtr,
                  textInputType: TextInputType.text,
                  hintText: "Nhập mô tả sp",
                  labelText: "Mô tả ",
                  icon: Icons.description,
                ),
                SizedBox(height: 10),
                CustomInput(
                  onChangefn: (v) {
                    c.addCategory(int.parse(cateCtr.text));
                  },
                  textEditingController: cateCtr,
                  textInputType: TextInputType.number,
                  hintText: "Nhập mã danh mục vd:36, 37",
                  labelText: "Danh mục",
                  icon: Icons.category,
                ),
                SizedBox(height: 10),
                CustomInput(
                  textEditingController: imgCtr,
                  textInputType: TextInputType.text,
                  hintText: "Nhập link ảnh",
                  labelText: "Hình ảnh",
                  icon: Icons.image,
                  validFn: (value) {},
                ),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38, width: 0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(
                    () => Row(
                      children: [
                        ...((c.productParams.value.images ?? [])
                            .map(
                              (item) => Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Image.network(item),
                                ),
                              ),
                            )
                            .toList()),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              c.pushImage(imgCtr.text);
                              imgCtr.clear();
                            },
                            child: Icon(Icons.add, color: Colors.white),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 100),
                SizedBox(
                  width: screenWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      c.addTitle(titleCtr.text);

                      c.createProduct(c.productParams.value);
                    },
                    child: Text(
                      "Tạo Sản Phẩm",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
