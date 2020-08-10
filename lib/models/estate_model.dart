import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login_app/ui/screens/explore_estates.dart';

class EstateModel {
String docId;
String type;
String city;
double area;
int price;
String address;
String description;
List<dynamic> features;
List<dynamic> images;
double longitude;
double latitude;

EstateModel({String type,String city,double area,int price,String address,String description,List<String> features, List<String> images, double longitude, double latitude,}){
  this.type = type;
  this.city = city;
  this.area = area;
  this.price = price;
  this.address = address;
  this.description = description;
  this.features = features;
  this.images = images;
  this.longitude = longitude;
  this.latitude = latitude;
  
    

}
toJson(){

return{
'type':this.type ,
'city' :this.city  ,
'area': this.area ,
'price': this.price ,
'address': this.address,
'description' :this.description,
'features': this.features,
'images': this.images,
'longitude': this.longitude,
'latitude': this.latitude,
};

}


EstateModel.fromJson(DocumentSnapshot ds){
  
  this.docId = ds.documentID;
  this.city = ds.data['city'];
  this.description= ds.data['description'];
  this.features = ds.data['features'];
  this.price = ds.data['price'];
  this.address = ds.data['address'];
  this.type = ds.data['type'];
  this.images = ds.data['images'];
  this.area = ds.data['area'];
  this.longitude = ds.data['longitude'];
  this.latitude = ds.data['latitude'];
  //print(images);
 // print(images);
  //  print(features);

  
}



/*
EstateModel({String type,String name,String title,String price,String address,String details}){
  this.type = type;
  this.city = name;
  this.space = title;
  this.price = price;
  this.address = address;
  this.details = details;
}
/*
getEstateType(){
  return this.type;
}
getEstateName(){
  this.name = name;
}
getEstateTitle(){
  this.title = title;
}
getEstatePrice(){
  this.price = price;
}
getEstateAddress(){
  this.address = address;
}
getEstateDetails(){
  this.details = details;
}
*/
toJson(){
return{
'type':this.type ,
'city' :this.city  ,
'title': this.title ,
'price': this.price ,
'address': this.address,
'details' :this.details,
};

}

EstateModel.fromJson(DocumentSnapshot documentSnapshot) {
    this.name = documentSnapshot.data['name'];
    this.address = documentSnapshot.data['address'];
    this.price = documentSnapshot.data['price'];
    this.title = documentSnapshot.data['title'];
    this.type = documentSnapshot.data['type'];
    this.details = documentSnapshot.data['details'];
    this.docId = documentSnapshot.documentID;
  }
*/
}