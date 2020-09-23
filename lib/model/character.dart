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
      description: "red is so cool i wish i was red",
      colors: [Colors.red.shade200, Colors.red.shade400]
  ),
  Character(
      name: "Cyan",
      imagePath: "assets/images/Cyan.png",
      description: "Cyan is so cool i wish i was Cyan",
      colors: [Colors.cyan.shade100, Colors.cyan.shade400]
  ),
];