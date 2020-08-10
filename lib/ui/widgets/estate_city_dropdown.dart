import 'package:firebase_login_app/models/city.dart';
import 'package:firebase_login_app/provider/providers_.dart';
import 'package:firebase_login_app/repositories/firebaseoperations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'estate_neighbourhood_dropdown.dart';

class EstateCityDropdown extends StatelessWidget {
  EstateCityDropdown._();
  static final EstateCityDropdown estateCityDropdown = EstateCityDropdown._();
  static  String currentCitySelected = '' ;
  List city=[];
  String ciyy=currentCitySelected;

  @override
  Widget build(BuildContext context) {
    Provider.of<EstateAtrributeProvider>(context).getAllCities();
    city = Provider.of<EstateAtrributeProvider>(context).cities;
   //\ getCitiesList(context);
    return Container(
      child: Row(
        children: <Widget>[
          
            DropdownButton(
              
             // style: ,
              icon: Icon(Icons.location_city),
              hint: Text('Click to Choose Estate City',style: TextStyle(color: Colors.blueAccent, fontSize: 20),),
              
              items: city.map((e) => DropdownMenuItem(
                value: e.getCity(),
                child: Text(e.getCity(),style: TextStyle(fontSize: 20, color: Colors.blue),))).toList(), 
              onChanged: (city){
                currentCitySelected = city;



              }),
          
        GestureDetector(child: Text('add new city'),
        onTap: (){
          Navigator.of(context).pushNamed('/city-control');

        },)

        ],
      ),
      
    );
  }
}