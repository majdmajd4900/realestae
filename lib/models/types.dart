import 'package:cloud_firestore/cloud_firestore.dart';

class Types{
    String name;

  Types(String name){
    this.name = name;
  }
  getType(){
    return name;
  }
  
  Types.fromDocumentSnapShot(DocumentSnapshot documentSnapshot){
    this.name = documentSnapshot.data['type'];
   // print (documentSnapshot.data['city']);
   // return City(name);

  }
typeToJson(){
  return{
    'type': name
  };
}
}