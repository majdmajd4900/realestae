import 'package:cloud_firestore/cloud_firestore.dart';

class City{
  String name;

  City(String name){
    this.name = name;
  }
  getCity(){
    return name;
  }
  
  City.fromDocumentSnapShot(DocumentSnapshot documentSnapshot){
    this.name = documentSnapshot.data['city'];
   // print (documentSnapshot.data['city']);
   // return City(name);

  }
cityToJson(){
  return{
    'city': name
  };
}
}