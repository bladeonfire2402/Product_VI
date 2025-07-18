import 'package:banhat/data/models/category_model.dart';
import 'package:flutter/foundation.dart';

class Product {
  String? id;
  String? title;
  int? price;
  String? description;
  CategoryModel? category;
  List<String>? images;

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

class CategoryModel {
  String id;
  String? name;
  String? images;

  CategoryModel({required this.id, required this.name, required this.images});

   // ✅ THÊM: chuyển JSON → object
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id']?.toString() ?? '',
      name: json['name'],
      images: json['images'],
    );
  }

  // CHUYỂN TỪ OBJECT → JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'images': images,
    };
  }
}