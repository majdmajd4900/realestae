import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EstateFeature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 2,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],),
      height:20 , width: 170,
  //color: Color.fromRGBO(236, 237, 239, 1),
    child: Row(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left:10.0,bottom:5),
        child: Icon(FontAwesomeIcons.bed,color: Colors.black38,),
      ),
      Padding(
        padding: const EdgeInsets.only(left:10 ,bottom: 5),
        child: Text('3 Bedrooms',style:TextStyle(color: Color.fromRGBO(30, 98, 232, 1),fontWeight: FontWeight.bold) ,),
      )
    ],),

      
    );
  }
}