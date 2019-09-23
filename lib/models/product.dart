enum Category { Electronics, Cars, Mode }

class Product {
  //region Fields
  final String id;
  final Category category;
  //endregion

  //region Constructor(s)
  Product(this.id, this.category);
  Product.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        category = map['category'];
  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        category = json['category'];
  //endregion

  //region Getter(s) and Setter(s)
  //endregion

  //region Method(s)
  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category,
      };
  Map<String, dynamic> toMap() => {
        'id': id,
        'category': category,
      };
  //endregion

}
