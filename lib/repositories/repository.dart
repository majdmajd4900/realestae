import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login_app/models/city.dart';
import 'package:firebase_login_app/models/estate_model.dart';
import 'package:firebase_login_app/models/types.dart';
import 'package:firebase_login_app/repositories/firebaseoperations.dart';

class Repository {
Repository._();
static final Repository repository = Repository._();

addNewCity(City city){
  //City city = City(cityName) ;
  
  FirebaseOperations.firebaseOperations.addNewCity(city.cityToJson());


}
Future<List<City>> getAllCities()async {
  List <DocumentSnapshot> documentSnapshot = await FirebaseOperations.firebaseOperations.getPropertyCitiesFromDataBase();
  //print('sdfsdfds');
  //print(documentSnapshot.first.data);
  List<City> cities = documentSnapshot.map((e) => City.fromDocumentSnapShot(e)).toList();
  return cities;
}

Future<List<Types>> getAllTypes()async {
  List <DocumentSnapshot> documentSnapshot = await FirebaseOperations.firebaseOperations.getPropertyTypeFromDataBase();
  //print('sdfsdfds');
  //print(documentSnapshot.first.data);
  
  List<Types> types = documentSnapshot.map((e) => Types.fromDocumentSnapShot(e)).toList();
  return types;
}

addNewType(Types type){
  //City city = City(cityName) ;
  
  FirebaseOperations.firebaseOperations.addNewType(type.typeToJson());


}

addNewEstate(EstateModel estateModel){

FirebaseOperations.firebaseOperations.addNewEstate(estateModel.toJson());
 
}

Future<List<EstateModel>> getAllEstates()async {
  List <DocumentSnapshot> documentSnapshot = await FirebaseOperations.firebaseOperations.getAllEstates();
  //print('sdfsdfds');
  //print(documentSnapshot.first.data);
  List<EstateModel> estates = documentSnapshot.map((e) {
    
    
    return EstateModel.fromJson(e);
  }).toList();
  return estates;
}
Future<List<EstateModel>> queryEstateByCity(String city)async {
  List <DocumentSnapshot> documentSnapshot = await FirebaseOperations.firebaseOperations.queryByCity(city);
  //print('sdfsdfds');
  //print(documentSnapshot.first.data);
  List<EstateModel> estates = documentSnapshot.map((e) {
    
    
    return EstateModel.fromJson(e);
  }).toList();
  return estates;
}


}