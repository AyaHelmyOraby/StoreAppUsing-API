class ProductModel {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final String category;
  final RatingModel? rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.category,
      this.rating});
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        id: jsonData["id"],
        title: jsonData["title"],
        price: jsonData["price"],
        description: jsonData["description"],
        image: jsonData["image"],
        category: jsonData["category"],
        rating: RatingModel.fromJson(jsonData["rating"]));
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rate: jsonData["rate"], count: jsonData["count"]);
  }
}
