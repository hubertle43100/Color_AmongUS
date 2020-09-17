import 'package:amongus/model/character.dart';
import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;   // taken account of the size (height) of any device
    final screenWidth = MediaQuery.of(context).size.width;     // taken account of the size (width) of any device

    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: CharacterCardBackgroundClipper(),
            child: Container(
              height: 0.55 * screenHeight,  //0.55 = 55% of the screen
              width: 0.9 * screenWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: characters[0].colors, //comes from the character class
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft
                )
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {    //shape of how the color block is created
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;  //this is the distance between the width & height of the rectangle

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);    ///line to is the path to get to each corner
    clippedPath.quadraticBezierTo(       //quadraticBezier is to make curves of the rectangle
        1, size.height - 1, 0 + curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(
        size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(
        size.width - 1, 0, size.width - curveDistance - 5,    //slope of the top right corner going down to the left top corner
        0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}