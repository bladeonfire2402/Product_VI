import 'package:banhat/controller/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Productpage extends StatelessWidget {
  const Productpage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(title: Text('Đặng Bá Nhất', textAlign: TextAlign.center)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    spacing: 10,
                    children: controller.productList.map((item)=>
                    Container(
                      width:  MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(item.images![0],height: 60, width: 60,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.title ?? '',style: TextStyle(color: Colors.white,),
                              softWrap: true,overflow: TextOverflow.visible,
                              maxLines: 2,
                              ),
                              Text(item.price.toString(),style: TextStyle(color: Colors.white),)
                            ],
                          )
                        ],
                      ),
                    )).
                    toList(),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
