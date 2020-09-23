import 'package:amongus/model/character.dart';
import 'package:amongus/pages/character_detail_screen.dart';
import 'package:amongus/styleguide.dart';
import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget{
  final Character character;

  const CharacterWidget({Key key, this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;   // taken account of the size (height) of any device
    final screenWidth = MediaQuery.of(context).size.width;     // taken account of the size (width) of any device

    return InkWell(
      onTap: () {
        Navigator.push(context, PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 350),
          pageBuilder: (context,_,__) => CharacterDetailScreen(character: character)));
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: CharacterCardBackgroundClipper(),
              child: Hero (
                tag: "background-${character.name}",
              child: Container(
                height: 0.55 * screenHeight,  //0.55 = 55% of the screen
                width: 0.9 * screenWidth,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: character.colors, //comes from the character class
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft
                  )
                ),
              ),
            ),
            ),
          ),
          Align(
            alignment: Alignment(0,-0.5),  //moves image around
            child:Hero(
              tag: "image-${character.name}",  //make sure it's characters[0] or the animation will not work
              child: Image.asset(
                character.imagePath,
                height: screenHeight * 0.55,
              ),
            ),
          ),
          Padding(    //basically making safe areas for the text/heading
            padding: const EdgeInsets.only(left: 48, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Hero(  //I think hero is the animation to drag the image to a specific spot
                  tag: "name-${character.name}",  //can be replace with $widget.character.name
                  child: Material(
                   color: Colors.transparent,
                   child: Container(
                     child: Text(
                        character.name,
                        style: AppTheme.heading,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Tap to read more",
                  style: AppTheme.subHeading,)
              ],
            ),
          ),
        ],
      ),
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