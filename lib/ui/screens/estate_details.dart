import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:clippy_flutter/paralellogram.dart';
import 'package:firebase_login_app/models/estate_model.dart';
import 'package:firebase_login_app/ui/widgets/estate_image_slider.dart';
import 'package:firebase_login_app/ui/widgets/estate_features.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';


class EstateDetails extends StatelessWidget {
  String pageName='estate details';
 // ..EstateModel estateModel;
 // EstateDetails();
  //EstateDetails.passModel(EstateModel estateModel){
   // this.estateModel = estateModel;
  
  
  @override
  Widget build(BuildContext context) {
    //print(estateModel.city);
    final EstateModel estateModel = ModalRoute.of(context).settings.arguments;
    print(estateModel.area);
    return Scaffold(backgroundColor: Color.fromRGBO(236, 237, 239, 1),
      body: ListView(
        children: [
          SizedBox(
            height: 400,
        
            child: Stack(children: <Widget>[
              ClipRRect(
                  
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0),bottomLeft: Radius.circular(20.0)),
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.18),
                       )
                      
                    ]),
                    height: 400,
                    width:366,
                    child: EstateImageSlider(estateModel.images),
                  )),
              Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 20, top: 50),
                      child: GestureDetector(
                                              child: Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: Colors.white,
                        ),
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                      )),
                  GestureDetector(
                    onTap: (){
                     // Map m = {};
                     Map m ={'model': estateModel,
                     'source page' : pageName};
                      Navigator.of(context).pushNamed('/map-screen',arguments: m );


                    },
                                      child: Padding(
                        padding: EdgeInsets.only(left: 220, top: 50),
                        child: Icon(
                          FontAwesomeIcons.mapMarked,
                          color: Colors.white,
                        )),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 30, top: 50),
                      child: Icon(
                        FontAwesomeIcons.share,
                        color: Colors.white,
                      )),
                ],
              ),
              /*Padding(
                padding: EdgeInsets.only(top: 350, left: 150),
                child: Row(children: <Widget>[
                  Icon(FontAwesomeIcons.circle, color: Colors.white),
                  Icon(
                    FontAwesomeIcons.solidCircle,
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    size: 10,
                  ),
                  Icon(
                    FontAwesomeIcons.solidCircle,
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    size: 10,
                  ),
                  Icon(
                    FontAwesomeIcons.solidCircle,
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    size: 10,
                  ),
                  Icon(
                    FontAwesomeIcons.solidCircle,
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    size: 10,
                  ),
                  Icon(
                    FontAwesomeIcons.solidCircle,
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    size: 10,
                  ),
                  Icon(
                    FontAwesomeIcons.solidCircle,
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    size: 10,
                  )
                ]),
              )

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
  
    
  
                                            'Studio Appartment',
  
    
  
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
  
    
  
                                          ),
  
    
  
                                          Padding(
  
    
  
                                              padding: EdgeInsets.only(left: 50),
  
    
  
                                              child: Text('15000' + '\$',
  
    
  
                                                  style: TextStyle(
  
    
  
                                                      fontWeight: FontWeight.bold,
  
    
  
                                                      fontSize: 16,
  
    
  
                                                      color: Color.fromRGBO(30, 98, 232, 1))))
  
    
  
                                        ])),
  
    
  
                                    Padding(
  
    
  
                                        padding: EdgeInsets.only(top: 215, left: 10),
  
    
  
                                        child: Text(
  
    
  
                                          'Gaza , Alnaser St , 102 ap',
  
    
  
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
  
    
  
                                              Text('150 m2',
  
    
  
                                                  style: TextStyle(
  
    
  
                                                      color: Color.fromRGBO(30, 98, 232, 1),
  
    
  
                                                      fontWeight: FontWeight.bold,
  
    
  
                                                      fontSize: 12)),
  
    
  
                                            ],
  
    
  
                                          ),
  
    
  
                                        )),*/
            ]),
          ),

          //EstateStack(),

          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              estateModel.type,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),

          Padding(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text(
               estateModel.city + '  ' + estateModel.address,
                style: TextStyle(
                    fontFamily: 'Aldahabi',
                    fontSize: 12,
                    color: Color.fromRGBO(0, 0, 0, 0.5)),
              )),

          Padding(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text(
                estateModel.area.toString()+' M2',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color.fromRGBO(30, 98, 232, 1)),
              )),

          SizedBox(
            height: 50,
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 5,left:10
                    ),
                    child: EstateFeature(),
                  );
                }),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(estateModel.description,style: TextStyle(fontSize: 10,color: Color.fromRGBO(0 , 0, 0, 0.5)),),
            //'this is a test Text . this is a test Text . this is a test Text . this is a test Text . this is a test Text . this is a test Text . this is a test Text . this is a test Text . this is a test Text . this is a test Text . '
          ),
          Stack(children: <Widget>[
            SizedBox(
              height: 69,
              width: 414,
              child: Container(color:Color.fromRGBO(255, 255, 255, 0.24)),),
            Row(
                          children: <Widget>[ 
                            Diagonal(
                    clipHeight: 20.0,
                    axis: Axis.vertical,
                    position: DiagonalPosition.TOP_RIGHT,
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/diagonal_demo'),
                      child: Container(
                        color: Color.fromRGBO(30, 98, 232, 1),
                        width: 190.0,
                        height: 69.0,
                        child: Center(child: Text('\$ ' + estateModel.price.toString(),style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromRGBO(255, 255, 255, 1)),)
                ),
                      ),
                    ),
                  ),
                          Padding(
            padding: const EdgeInsets.only(right:10.0),
            child: Text('Check Availabilty', style: TextStyle(color: Color.fromRGBO(30, 98, 232, 1),fontSize: 15),),
          ),]),
          ],
          

          )

          



          // Expanded(child: Text('sdfsd')),
        ],
      ),
    );
  }
}
