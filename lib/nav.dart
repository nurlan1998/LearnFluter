import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Nav{
  final IconData icon;
  final String title;

  Nav({required this.icon,required this.title});

  Nav.fromMap(Map<String,dynamic> json)
  : this(
    icon: json["icon"],
    title: json["title"],
  );
}

List<Nav> navs = [
  Nav(icon: Icons.home,title: "Home page"),
  Nav(icon: Icons.account_circle, title: "Profile")
];