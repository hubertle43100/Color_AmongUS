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
      description: "Red is always wearing costumes and has pets",
      colors: [Colors.red.shade200, Colors.red.shade400]
  ),
  Character(
      name: "CYAN",
      imagePath: "assets/images/Cyan.png",
      description: "Really quiet for some reason during meetings."
          "Sometimes they"
          "'[insert color here] is sus'[color] was not an imposter",
      colors: [Colors.cyan.shade100, Colors.cyan.shade400]
  ),
  Character(
      name: "LIME GREEN",
      imagePath: "assets/images/Lgreen copy.v1.png",
      description: "Either plays like a pro or plays like an idiot. "
          "They never do any of their task and sits on cameras all round "
          "even when the sabotage goes off.",
      colors: [Colors.lightGreenAccent.shade100, Colors.lightGreen.shade400]
  ),
  Character(
      name: "GREEN",
      imagePath: "assets/images/greengreen.v1.png",
      description: "Green is always being accused even if they are not the imposter."
          " Green trolls by saying 'How do I go in the vent like [insert color here] did?'",
      colors: [Colors.green.shade200, Colors.green.shade400]
  ),

];