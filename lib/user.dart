import 'package:flutter/cupertino.dart';

class User{
  final int id;
  final String name;
  final String userName;
  final String email;

  User({required this.id,required this.name,required this.userName,required this.email});

  User.fromJson(Map<String,dynamic> json): this(
    id: json["id"],
    name: json['name'],
    userName: json['username'],
    email: json['email'],
  );
}