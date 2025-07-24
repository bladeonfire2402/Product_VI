import 'package:banhat/data/models/category_model.dart';

class Product {
  String? id;
  int? price;
  String? title;
  String? description;
  List<String>? images;
  CategoryModel? category;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.images,
    required this.category,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id']?.toString(), // phòng khi ID là int
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'])
          : null,
      images: json['images'] != null
          ? List<String>.from(json['images'])
          : [],
    );
  }
}
