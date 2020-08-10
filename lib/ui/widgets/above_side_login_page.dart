import 'package:flutter/material.dart';

class AboveSideLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container( 
    child: Stack(
      children: <Widget>[
        Container(
          height: 812/2.5,
          width: 375,
          child: Image.network('https://i.ytimg.com/vi/oyA7Ucnmje4/maxresdefault.jpg',fit: (BoxFit.fill),)),
       // Positioned(bottom: 0.8,left: 0.2,
        Positioned(bottom: 300,left: 10,child: Text('Welcome to Dream home',textScaleFactor: 0.3,style: TextStyle(color: Colors.white),))

      ],),
      
    );
  }
}