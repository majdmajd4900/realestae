import 'package:firebase_login_app/models/estate_model.dart';
import 'package:firebase_login_app/provider/providers_.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';


class MapScreen extends StatelessWidget {
 // MapScreen();
 //MapScreen._();
 //static final  MapScreen mapScreen = MapScreen._();
 

  double latitude=0,longtude=0;
  GoogleMapController googleMapController;
  LatLng initialPostition = LatLng(31.4167, 34.3333);
   Set<Marker> markers = {};
  getMyLocation() async {
    Geolocator myLocation = await Geolocator();
    Position myPosition = await myLocation.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    markers.add(Marker(
        markerId: MarkerId(myPosition.latitude.toString()),
        position: LatLng(myPosition.latitude, myPosition.longitude)));

      googleMapController.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(zoom: 13,target: LatLng(myPosition.latitude, myPosition.longitude)))) ;
     

  }

  
      getPlaceName(LatLng position)async{
      List<Address> address =await Geocoder.google('AIzaSyDJSzZCK_zbh5bPnVrwDREc5jaslDXcrU8').findAddressesFromCoordinates(Coordinates(position.latitude,position.longitude ));
      print(address[4].addressLine);

        
      }

  @override
  Widget build(BuildContext context) {
    Map comingFromData = ModalRoute.of(context).settings.arguments;
    String sourcePage = comingFromData['source page'];

    //markers = Provider.of<EstateAtrributeProvider>(context).getMarkers();
  /*  markers.add(Marker(
        markerId: MarkerId(initialPostition.latitude.toString()),
        position: initialPostition));*/
    if(sourcePage == 'adding page'){
      return Scaffold(
          body: Stack(
                      children:<Widget>[
                       GoogleMap(
        onMapCreated: (GoogleMapController googleMapController){
            this.googleMapController = googleMapController;

        },
        initialCameraPosition: CameraPosition(target: initialPostition, zoom: 10.5),
        markers:  Provider.of<EstateAtrributeProvider>(context).markers,
        onTap: (value) {
      //   MarkerId markerId = MarkerId(value.latitude.toString());
            
              
              
             // Provider.of<EstateAtrributeProvider>(context).markers.clear();
             markers.clear();
            // Provider.of<EstateAtrributeProvider>(context,listen: false).setMarkers(markers);

            
               markers.add(Marker(
                  markerId: MarkerId(value.latitude.toString()),
                  position: LatLng(value.latitude, value.longitude)));
                  latitude = value.latitude;
                  longtude = value.longitude;

                  Provider.of<EstateAtrributeProvider>(context,listen: false).setMarkers(markers);
                  
              

           
              //Provider.of(context).
            
        },
      ),
      GestureDetector(
        onTap: (){
          Fluttertoast.showToast(
        msg: (sourcePage=='estatePage')?'Map Closed': "Position has been added Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
          Navigator.pop(context);},
              child: Padding(
          padding: const EdgeInsets.only(left:8.0 , top: 500),
          child: Container(color: Colors.white,
            width: 50,
            height: 50,
            child: Center(child: Icon(Icons.done,size:40 ,color: Colors.green,))),
        ),
      )
      ]
          ),
      /*floatingActionButton: FloatingActionButton(onPressed: (){
        //getMyLocation();
       // getPlaceName(initialPostition);
      }),*/
    );}

  if(sourcePage == 'estate details'){
    Provider.of<EstateAtrributeProvider>(context).getAllEstates();
    EstateModel estateModel = comingFromData['model'];
    print('estate page');
      return Scaffold(
          body: Stack(
                      children:<Widget>[
                       GoogleMap(
        onMapCreated: (GoogleMapController googleMapController){
          
            this.googleMapController = googleMapController;
            

               // markers.clear();
                //Position position = Position(latitude: estateModel.latitude  ,longitude:estateModel.longitude );
              //  markers.add(Marker(markerId: MarkerId('estate position'),position: LatLng(estateModel.latitude, estateModel.longitude)));
                
             //   Provider.of<EstateAtrributeProvider>(context,listen: false).setMarkers(markers);

        },
        initialCameraPosition: CameraPosition(target: LatLng(estateModel.latitude, estateModel.longitude), zoom: 13.5),
        markers:  Provider.of<EstateAtrributeProvider>(context).markers,
        
      ),
      GestureDetector(
        onTap: (){
          Fluttertoast.showToast(
        msg: "Map has been closed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
          Navigator.pop(context);},
              child: Padding(
          padding: const EdgeInsets.only(left:8.0 , top: 500),
          child: Container(color: Colors.white,
            width: 50,
            height: 50,
            child: Center(child: Icon(Icons.done,size:40 ,color: Colors.green,))),
        ),
      )
      ]
          ),
      /*floatingActionButton: FloatingActionButton(onPressed: (){
        //getMyLocation();
       // getPlaceName(initialPostition);
      }),*/
    );}
  }
}
