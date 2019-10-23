/*
 * Copyright (c) 2019. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

class Category {
  //region Field(s)
  final String name;
  final String description;
  final List<Category> subCategories;
  //endregion

  //region Constructor(s)
  Category({this.name, this.description, this.subCategories});

  Category.fromJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.description = json['description'],
        this.subCategories = json['subCategories'];

  Category.fromMap(Map<String, dynamic> map)
      : this.name = map['name'],
        this.description = map['description'],
        this.subCategories = map['subCategories'];
  //endregion

  //region Getter(s) and Setter(s)

  //endregion

}
