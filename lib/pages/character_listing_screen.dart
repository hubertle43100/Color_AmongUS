import 'package:amongus/styleguide.dart';
import 'package:flutter/material.dart';

class CharacterListingScreen extends StatefulWidget {
  @override
  _CharacterListingScreenState createState() => _CharacterListingScreenState();
}

class _CharacterListingScreenState extends State<CharacterListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(icon: Icon(Icon.arrow_back_ios),      (not working)
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            //child: Icon(Icon.search),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 8.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "Among Us", style: AppTheme.display1),
                  TextSpan(text: "\n"),
                  TextSpan(text: "Characters", style: AppTheme.display2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
