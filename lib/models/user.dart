//TODO: Create class Address

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  //region Field(s)
  final String id;
  final String name;
  final Address address;
  final String contact;
  final String email;
  //endregion

  //region Constructor(s)
  User({this.id, this.name, this.address, this.contact, this.email});

  User.fromMap(Map<String, dynamic> snapshot)
      : id = snapshot['id'],
        name = snapshot['name'],
        address = snapshot['address'],
        contact = snapshot['contact'],
        email = snapshot['email'];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  //endregion

  //region Getter(s) and Setter(s)
  String get initials {
    var tokens = name.split(' ');
    if (tokens.length < 2)
      return name.substring(0, 2).toUpperCase();
    else
      return tokens[0].substring(0, 1).toUpperCase() +
          tokens[1].substring(0, 1).toUpperCase();
  }
  //endregion

  //region Method(s)
  Map<String, dynamic> toJson() => _$UserToJson(this);
  //endregion

}

@JsonSerializable()
class Address {
  final int streetNumber;
  final int blocNumber;
  final String street;
  final String city;
  final String province;
  final String state;

  Address({
    this.streetNumber,
    this.blocNumber,
    this.street,
    this.city,
    this.province,
    this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
