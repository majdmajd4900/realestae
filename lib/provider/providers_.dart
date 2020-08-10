import 'package:firebase_login_app/models/city.dart';
import 'package:firebase_login_app/models/estate_model.dart';
import 'package:firebase_login_app/models/types.dart';
import 'package:firebase_login_app/repositories/firebaseoperations.dart';
import 'package:firebase_login_app/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';

class EstateAtrributeProvider extends ChangeNotifier{
  // for getting avilable cites
  List<City> cities= [] ; 
  List<Types> types = [];
  List<EstateModel> estates=[];
  List<String> uploadedUrlImage=[];
  String city;
  String type;
  Set<Marker> markers = {};

  //seting the estate variables
setMarkers(Set<Marker> markers){
this.markers.union(markers);

  notifyListeners();


}

  Map map = {
'bedroom': Icon(FontAwesomeIcons.bed),
'solar system' : Icon(FontAwesomeIcons.solarPanel),
'kitchen': Icon(FontAwesomeIcons.utensilSpoon),
'bathroom' :Icon(MdiIcons.scaleBathroom),
  };


uploadImagesAndGetUrls(List<Asset> pickedImages)async {
List<String> urlsOfUploadedImages =   await FirebaseOperations.firebaseOperations.uploadImage(pickedImages);
this.uploadedUrlImage = urlsOfUploadedImages;
}

//cities 


  addNewCity(String cityName){
    Repository.repository.addNewCity(City(cityName));
   // print(cityName);

  }


// types
  
  getAllTypes()async {
    try {
      List<Types> types =
          await Repository.repository.getAllTypes();
     //    print('kjk');
      this.types = types;
     // print(cities.first);
      
      notifyListeners();
      return types;
      

      
    } catch (error) {
      print(error);
    }
  }

  addNewType(String typeName){
    Repository.repository.addNewType(Types(typeName));
    print(typeName);

  }

  addNewEstate(EstateModel estateModel){
    Repository.repository.addNewEstate(estateModel);
  }

  getAllEstates()async {
    try {
      List<EstateModel> estates =
          await Repository.repository.getAllEstates();
     //    print('kjk');
      this.estates = estates;
      for(var x=0; x < estates.length;++x)
      {
        this.markers.add(Marker(markerId: MarkerId(x.toString()+estates[x].latitude.toString()) , position: LatLng(estates[x].latitude, estates[x].longitude)));
      }
      //print(estates[1].images[1]);
     // print(cities.first);
      
      notifyListeners();
      return estates;
      

      
    } catch (error) {
      print(error);
    }
  }

  estateQueryByCity(String city){
  List<EstateModel> newEstates = [];
  if(city==null|| city==''){
  getAllEstates();
    }
  else{
    //getAllEstates();
      print('inside f');
  for(var index = 0 ; index <estates.length ; ++index){
    print('inside loop');

    if(estates[index].city.contains(city)){
      print('inside f$index');
      newEstates.add(estates[index]);
      print('after add');
      notifyListeners();
  }

  

  
}estates = newEstates;
  notifyListeners();
  }}

getEstateByCity(String city)async {
  print('search by query Provider');
    try {
      List<EstateModel> estates =
          await Repository.repository.queryEstateByCity(city);
     //    print('kjk');
      this.estates = estates;
      //print(estates[1].images[1]);
     // print(cities.first);
        print('search by query Provider2');

      notifyListeners();
      return estates;
      

      
    } catch (error) {
      print(error);
    }
  }

getAllCities()async {
    try {
      List<City> city =
          await Repository.repository.getAllCities();
     //    print('kjk');
      this.cities = city;
     // print(cities.first);
      
      notifyListeners();
      return cities;
      

      
    } catch (error) {
      print(error);
    }
  }

}

