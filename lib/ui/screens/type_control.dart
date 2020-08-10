import 'package:firebase_login_app/models/city.dart';
import 'package:firebase_login_app/models/types.dart';
import 'package:firebase_login_app/provider/providers_.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class TypeControl extends StatelessWidget {
  List<Types> types;
  String typeName;
  TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    types = Provider.of<EstateAtrributeProvider>(context).types;
    return Scaffold(
      appBar: AppBar(
        title: Text('Types Control'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: types.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(types[index].getType());
                }),
          ),
          TextField(
            controller: textEditingController,
            onChanged: (text){
            this.typeName=text;
            print(text);
            },
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Enter City Name'),
          ),
          RaisedButton(onPressed: (){
            print(typeName);
            Provider.of<EstateAtrributeProvider>(context,listen: false).addNewType(typeName);
            
      Fluttertoast.showToast(
        msg: "City $typeName has been added Successfully",
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
