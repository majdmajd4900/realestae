import 'package:firebase_login_app/provider/providers_.dart';
import 'package:firebase_login_app/ui/screens/explore_estates.dart';
import 'package:firebase_login_app/ui/widgets/filter_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  BottomSheeetFilterModel bottomSheeetFilterModel = new BottomSheeetFilterModel();
    int onChangedCounter = 0;
 // int length2 =0;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(236, 237, 239, 1),
        child: Column(children: <Widget>[
          Stack(children: <Widget>[
            Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(FontAwesomeIcons.mapMarkerAlt),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('in'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: 180,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Gaza',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(30, 98, 232, 1),
                        
                        )),
                    onChanged: (city)async {
                     await Provider.of<EstateAtrributeProvider>(context,listen: false).getEstateByCity(city);

                     

                     
                     
                    // print('2');
                     //await print(Provider.of<EstateAtrributeProvider>(context,listen: false).estates.length);
                    // print('3');

                    },
                    
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Icon(FontAwesomeIcons.search)),
              Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: GestureDetector(
                    child: Icon(FontAwesomeIcons.filter),
                    onTap: (){
                      return bottomSheeetFilterModel.showBotSheet(context);
                      //Navigator.of(context).pushNamed('/home-page');
                    },
                    ))
            ]),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 40, 60, 0),
              child: new Divider(
                color: Color.fromRGBO(62, 62, 62, 0.1),
                thickness: 1.5,
              ),
            )
          ])
        ]));
  }
}
