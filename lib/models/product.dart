import 'package:mbom/models/category.dart';

enum Features { PROMOTED, FEATURED, BEST_SELLER, MOST_WANTED, BEST_RATED }

class Product {
  //region Fields
  final String id;
  final String name;
  final String description;
  final double price;
  //final double reduction;
  final Category category;
  final List<Features> features;
  final List<String> pictures;
  //endregion

  //region Constructor(s)
  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.category,
    this.features,
    this.pictures,
  });

  Product.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        description = map['description'],
        price = map['price'],
        category = map['category'],
        features = map['features'],
        pictures = map['pictures'];

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        price = json['price'],
        category = json['category'],
        features = json['features'],
        pictures = json['pictures'];
  //endregion

  //region Getter(s) and Setter(s)
  //endregion

  //region Method(s)
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'category': category,
        'features': features,
        'pictures': pictures,
      };
  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'category': category,
        'features': features,
        'pictures': pictures,
      };
  //endregion

}
