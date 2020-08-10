import 'package:firebase_login_app/models/estate_model.dart';
import 'package:firebase_login_app/provider/providers_.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EstateCard extends StatelessWidget {
  EstateModel estateModel;
  String title='';
  String address='';
  String price='';
  String area='';
  String mainImage='';
  List<String> images = [];
  EstateCard(EstateModel estateModel){
    this.title = estateModel.type ;
    this.address= estateModel.address;
    String priceTostring = estateModel.price.toString();
    this.price = priceTostring;
    String areaToString = estateModel.area.toString(); 
    this.area= areaToString;
    this.mainImage = estateModel.images[0];
  }
  setAttributes(BuildContext context){
    this.title = Provider.of<EstateAtrributeProvider>(context).estates[1].city;
        this.address = Provider.of<EstateAtrributeProvider>(context).estates[1].city;

    this.price = Provider.of<EstateAtrributeProvider>(context).estates[1].city;

    this.area = Provider.of<EstateAtrributeProvider>(context).estates[1].city;

  }
  // EstateCard(EstateModel esateModel)
  //{
  //  this.estateModel = estateModel;
  //}
  @override
  Widget build(BuildContext context) {
   // setAttributes(context);
    return Container(
      color: Color.fromRGBO(236, 237, 239, 1),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 290,
      width: double.maxFinite,
      child: Card(
        color: Color.fromRGBO(236, 237, 239, 1),
        child: Stack(children: <Widget>[
          Container(width: 366,height: 180,
            child: ClipRRect(
              
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                  image: NetworkImage(mainImage
                      ),
                  fit: BoxFit.cover,
                )),
          ),
          Padding(
              padding: EdgeInsets.only(left: 290, top: 14),
              child: Icon(
                FontAwesomeIcons.heart,
                color: Colors.white,
              )),
          Padding(
              padding: EdgeInsets.only(left: 20, top: 14),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                ),
                child: Text('  20 km away  ',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    )),
              )),
          Padding(
              padding: EdgeInsets.only(top: 190, left: 10),
              child: Row(children: <Widget>[
                Text(
                  title??'',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text(price??'' + '\$',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromRGBO(30, 98, 232, 1))))
              ])),
          Padding(
              padding: EdgeInsets.only(top: 215, left: 10),
              child: Text(
                address??'',
                style: TextStyle(
                    fontFamily: 'Aldahabi',
                    fontSize: 12,
                    color: Color.fromRGBO(0, 0, 0, 0.5)),
              )),
          Padding(
              padding: EdgeInsets.only(top: 235, left: 10),
              child: Container(
                color: Color.fromRGBO(224, 231, 242, 100),
                child: Row(
                  children: <Widget>[
                    Text(
                      '3 Bedrooms',
                      style: TextStyle(
                          color: Color.fromRGBO(30, 98, 232, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    Text('4 baths',
                        style: TextStyle(
                            color: Color.fromRGBO(30, 98, 232, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                    Text(area??'',
                        style: TextStyle(
                            color: Color.fromRGBO(30, 98, 232, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
