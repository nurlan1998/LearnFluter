import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User{
  final int id;
  final String name;
  final String username;
  final String email;
  final UserAddress? address;

  User({required this.id,required this.name,required this.username,required this.email,required this.address});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserAddress{
  final String street;
  final String zipcode;
  final String city;
  final String suite;

  UserAddress({required this.street,required this.zipcode,
    required this.city,required this.suite});

  factory UserAddress.fromJson(Map<String, dynamic> json) => _$UserAddressFromJson(json);
  Map<String, dynamic> toJson() => _$UserAddressToJson(this);

}