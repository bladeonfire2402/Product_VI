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