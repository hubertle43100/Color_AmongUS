import 'package:flutter/material.dart';

class Character {
  final String name;
  final String imagePath;
  final String description;
  final List<Color> colors;

  Character({this.name, this.imagePath, this.description, this.colors});
}

List characters = [
  Character(
      name: "Kevin",
      imagePath: "assets/images/Green_Au.jpg",
      description: "green",
      colors: [Colors.green.shade200, Colors.lightGreen.shade400]
  ),
];