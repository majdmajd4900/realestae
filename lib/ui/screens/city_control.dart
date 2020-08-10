import 'package:firebase_login_app/models/city.dart';
import 'package:firebase_login_app/provider/providers_.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class CityControl extends StatelessWidget {
  List<City> city;
  String cityName;
  TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    city = Provider.of<EstateAtrributeProvider>(context).cities;
    return Scaffold(
      appBar: AppBar(
        title: Text('City Control'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: city.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(city[index].getCity());
                }),
          ),
          TextField(
            controller: textEditingController,
            onChanged: (text){
            this.cityName=text;
            print(text);
            },
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Enter City Name'),
          ),
          RaisedButton(onPressed: (){
            print(cityName);
            Provider.of<EstateAtrributeProvider>(context,listen: false).addNewCity(cityName);
             Fluttertoast.showToast(
        msg: "City $cityName has been added Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
    Navigator.of(context).pop();
          })
        ],
      ),
    );
  }
}
