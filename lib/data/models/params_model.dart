class ParamsModel {
   String? title;
   double? price;
   String? description;
   int? categoryId;
  List<String>? images;

  ParamsModel({
     this.title,
     this.categoryId,
     this.description,
     this.price,
     this.images,
  });

   Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'description': description,
      'categoryId': categoryId,
      'images': images,
    };
  }
}
