import 'package:flutter/material.dart';

class PropertiesControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
        RaisedButton(
          onPressed: (){
            Navigator.of(context).pushNamed('adding page');
          },
          child: Text('add new Estate'))
      ],)
      
    );
  }
}