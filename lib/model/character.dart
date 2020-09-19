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
      name: "Red",
      imagePath: "assets/images/red_only.png",
      description: "green",
      colors: [Colors.red.shade200, Colors.red.shade400]
  ),
];