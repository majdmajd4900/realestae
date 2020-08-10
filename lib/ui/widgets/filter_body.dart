import 'package:firebase_login_app/provider/providers_.dart';
import 'package:firebase_login_app/ui/widgets/estate_type_dropdown.dart';
import 'package:firebase_login_app/ui/widgets/slider.dart';
import 'package:firebase_login_app/ui/widgets/slider_.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'estate_city_dropdown.dart';
import 'estate_neighbourhood_dropdown.dart';

class FilterBody extends StatefulWidget {
  @override
  _FilterBodyState createState() => _FilterBodyState();
}

class _FilterBodyState extends State<FilterBody> {
  @override
  Widget build(BuildContext context) {
    
  
 
 }
}


class BottomSheeetFilterModel{

showBotSheet(BuildContext context){
showModalBottomSheet(context: context, builder: (BuildContext context){
 // Provider.of<EstateAtrributeProvider>(context,listen: false).getEstateByCity(EstateCityDropdown.estateCityDropdown.ciyy);

  return Container(color: Colors.red[70],
    child: Column(children: <Widget>[
      
      Text('Search Filters', style: TextStyle(color: Colors.black, fontSize: 25 ),),
      EstateTypeDropdown.estateTypeDropdown,
      EstateCityDropdown.estateCityDropdown,
      SliderWidget(),
      

      
      ]
    ),
      
    );
});

}

}