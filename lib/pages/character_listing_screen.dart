import 'package:amongus/model/character.dart';
import 'package:amongus/styleguide.dart';
import 'package:amongus/widgets/character_widget.dart';
import 'package:flutter/material.dart';

class CharacterListingScreen extends StatefulWidget {
  @override
  _CharacterListingScreenState createState() => _CharacterListingScreenState();
}

class _CharacterListingScreenState extends State<CharacterListingScreen> {
  PageController _pageController; //page controller lets you wipe to other character
  int currentPage = 0;

  @override
  void initState(){
    super.initState();
    _pageController = PageController(
      viewportFraction: 1.0, //take us from left of the screen to right
      initialPage: currentPage,
      keepPage: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),   //always make sure to put "s" in Icons.
          actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: SafeArea(    //Safe area keeps the color box from not touching the side of the screen
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,   // important to keep the words independent of the color block
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 8.0),
                child: RichText(        //Richtext helps with having multiple different text(bold / not bold) in many TextSpans
                  text: TextSpan(       //TextSpans can have many different styles
                    children: [
                      TextSpan(text: "Among Us", style: AppTheme.display1),
                      TextSpan(text: "\n"),
                      TextSpan(text: "Characters", style: AppTheme.display2),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    for (var i = 0; i< characters.length; i++)   //for loop displays two or more specified
                                                                  // character(how many you have in your character class
                      CharacterWidget(character: characters[i], pageController: _pageController, currentPage: i)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
