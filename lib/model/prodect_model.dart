class ProdectModel {
  final dynamic id;
  final dynamic title;
  final dynamic price;
  final dynamic description;
  final dynamic category;
  final dynamic image;
  final RatingModel ratingModel;

  ProdectModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingModel,
  });

  factory ProdectModel.fromJson(json) {
    return ProdectModel(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
        ratingModel: RatingModel.fromjson(json['rating']));
  }
}

class RatingModel {
  final dynamic rate;
  final dynamic count;
  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromjson(json) {
    return RatingModel(
      rate: json?["rate"],
      count: json?['count'],
    );
  }
}
