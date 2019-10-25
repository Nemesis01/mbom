// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      contact: json['contact'] as String,
      email: json['email'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address?.toJson(),
      'contact': instance.contact,
      'email': instance.email
    };

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
      streetNumber: json['streetNumber'] as int,
      blocNumber: json['blocNumber'] as int,
      street: json['street'] as String,
      city: json['city'] as String,
      province: json['province'] as String,
      state: json['state'] as String);
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'streetNumber': instance.streetNumber,
      'blocNumber': instance.blocNumber,
      'street': instance.street,
      'city': instance.city,
      'province': instance.province,
      'state': instance.state
    };
