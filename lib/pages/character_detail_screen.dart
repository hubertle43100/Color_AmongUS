import 'package:amongus/model/character.dart';
import 'package:flutter/material.dart';

import '../styleguide.dart';

class CharacterDetailScreen extends StatefulWidget {
  final Character character;

  const CharacterDetailScreen({Key key, this.character}) : super(key: key);
  @override
  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero( //animation stuff
            tag: "background-${widget.character.name}",
            child: DecoratedBox(
              decoration:  BoxDecoration(
                gradient: LinearGradient(
                  colors:  widget.character.colors,
                  begin:  Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
          ),
          SingleChildScrollView(   //this allows the user to scroll down and it provide space for paragrahs
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16),
                  child: IconButton(
                    iconSize: 40,
                    icon: Icon(Icons.close),
                    color: Colors.white.withOpacity(0.9),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                    child: Hero(
                        tag: "image-${widget.character.name}",    //move the among us character =>
                        child: Image.asset(widget.character.imagePath, height: screenHeight * 0.45)),
                  //getting the character image, name and description from the other class
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                  child:Hero(
                    tag: "name-${widget.character.name}",   //move the name =>
                    child: Material(
                      color: Colors.transparent,
                        child: Container(
                          child: Text(widget.character.name, style: AppTheme.heading),
                          ),
                      ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 8, 32),  //puts a box from Left,top,tight,bottom
                  child: Text(widget.character.description, style: AppTheme.subHeading,),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
