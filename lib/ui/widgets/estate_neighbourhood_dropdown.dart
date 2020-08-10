import 'package:firebase_login_app/provider/providers_.dart';
import 'package:firebase_login_app/ui/widgets/estate_city_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
/*
class EstateNeighbourhoodDropdown extends StatefulWidget {
  @override
  _EstateNeighbourhoodDropdownState createState() => _EstateNeighbourhoodDropdownState();
}

class _EstateNeighbourhoodDropdownState extends State<EstateNeighbourhoodDropdown> {
  //Function getCityDropDownValue;
  
    List<String> notChoosen =[];
    

  String dropdownValue='اختر الحي';
  @override
  Widget build(BuildContext context) {
    EstateAtrributeProvider estateAtrributeProvider =
        Provider.of<EstateAtrributeProvider>(context);

    String city = Provider.of<EstateAtrributeProvider>(context,).getCity();
    print(city);
    
      return DropdownButton(  
    onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
          print(dropdownValue);
        },
        hint: Text(dropdownValue),
        items:   Provider.of<EstateAtrributeProvider>(context).getnieghbourhoodsLists().map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList());
    
      
    }
  
  }
*/