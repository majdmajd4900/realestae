import 'package:firebase_login_app/models/city.dart';
import 'package:firebase_login_app/models/types.dart';
import 'package:firebase_login_app/provider/providers_.dart';
import 'package:firebase_login_app/repositories/firebaseoperations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'estate_neighbourhood_dropdown.dart';

class EstateTypeDropdown extends StatelessWidget {
  EstateTypeDropdown._();
  static final  EstateTypeDropdown estateTypeDropdown = EstateTypeDropdown._();
  static String currentCitySelected = '' ;
  List<Types> types=[];

  @override
  Widget build(BuildContext context) {
    Provider.of<EstateAtrributeProvider>(context).getAllTypes();
    types = Provider.of<EstateAtrributeProvider>(context).types;
   //\ getCitiesList(context);
    return Container(
      child: Row(
        children: <Widget>[
          DropdownButton(
            items: types.map((e) => DropdownMenuItem(
              value: e.getType(),
              child: Text(e.getType()))).toList(), 
            onChanged: (type){
              currentCitySelected = type;




            }),
        GestureDetector(child: Text('Add new Type'),
        onTap: (){
          Navigator.of(context).pushNamed('/type-control');

        },)

        ],
      ),
      
    );
  }
}