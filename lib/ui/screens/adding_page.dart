import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_login_app/models/estate_model.dart';
import 'package:firebase_login_app/models/features.dart';
import 'package:firebase_login_app/provider/providers_.dart';
import 'package:firebase_login_app/repositories/repository.dart';

import 'package:firebase_login_app/ui/widgets/custome_text_field.dart';
import 'package:firebase_login_app/ui/widgets/estate_city_dropdown.dart';
import 'package:firebase_login_app/ui/widgets/estate_type_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

class AddingPage extends StatelessWidget {
  String type;
  String city;
  double area;
  int price;
  String address;
  String description;
  List<String> features;
  List<String> images;

  String pageName = 'adding page';
 

  saveArea(String value) {
    this.area = double.parse(value);
  }

  savePrice(String value) {
    this.price = int.parse(value);
  }

  saveAddress(String value) {
    this.address = value;
  }

  saveDescription(String value) {
    this..description = value;
  }

  GlobalKey<FormState> formKey = GlobalKey();
  validatNumber(String value) {
    if (value == null || value == '') {
      return 'this field is required';
    } else if (!isNumeric(value)) {
      return 'allowed numbers only';
    }
  }

  validatString(String value) {
    if (value == null || value == '') {
      return 'this field is required';
    }
  }

  submitForm(context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Repository.repository.addNewEstate(EstateModel(
          address: this.address,
          area: this.area,
          price: this.price,
          description: this.description,
          features: this.features,
          images: this.images,
          type: EstateTypeDropdown.currentCitySelected,
          city: EstateCityDropdown.currentCitySelected,
          longitude: Provider.of<EstateAtrributeProvider>(context,listen: false).markers.toList()[0].position.longitude,
          latitude: Provider.of<EstateAtrributeProvider>(context,listen: false).markers.toList()[0].position.latitude));
    } else {
      return;
    }
  }
List<Asset> pickedImages;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(title: Text('Add new estate')),
        body: ListView(
          children: [
           
            GestureDetector(
              
              onTap: () async {
              pickedImages     = await MultiImagePicker.pickImages(maxImages: 10 ,);
              Provider.of<EstateAtrributeProvider>(context,listen: false).uploadImagesAndGetUrls(pickedImages);
              
}, child: Consumer<EstateAtrributeProvider>(
              builder: (context, value, child) {
                images=value.uploadedUrlImage;
                //List<String> imageUrl = value.uploadedUrlImage;
                var imageUrl = value.uploadedUrlImage;
                if (imageUrl == null|| imageUrl.isEmpty) {
                  return Container(
                    height: 250,
                    width: 250,
                    color: Colors.grey,
                    child: Icon(Icons.photo_album,size: 250/2,),
                  );
                } else {
                  return CachedNetworkImage(
                    imageUrl: 'https://previews.123rf.com/images/faysalfarhan/faysalfarhan1604/faysalfarhan160401210/55443099-done-validate-icon-green-square-button.jpg',
                    height: 250,
                    width: 250,
                  );
                }
              },
            )),
            Container(
              height: 700,
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: EstateCityDropdown.estateCityDropdown,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: EstateTypeDropdown.estateTypeDropdown,
                      ),
                    ),
                    CustomTextField(
                      textInputType: TextInputType.number,
                      label: 'Area',
                      validationFun: validatNumber,
                      saveFormField: saveArea,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      textInputType: TextInputType.number,
                      label: 'Price',
                      validationFun: validatNumber,
                      saveFormField: savePrice,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      label: 'address',
                      validationFun: validatString,
                      saveFormField: saveAddress,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      label: 'Description',
                      validationFun: validatString,
                      saveFormField: saveDescription,
                    ),

                    /*  ListView.builder(itemBuilder: (BuildContext context , int index){
  
                      return ListTile(
  
                        title: Provider.of<EstateAtrributeProvider>(context).map.keys.elementAt(index),
  
                        leading:Icon( Provider.of<EstateAtrributeProvider>(context).map.values.elementAt(index)),
  
                        trailing: Checkbox(value: null, onChanged: null),
  
                      );
  
                    }),*/

                    //Spacer(),
                    GestureDetector(
child: Icon(FontAwesomeIcons.mapMarked,size: 90,),
onTap: (){
  Map m ={
                     'source page' : pageName};
 Navigator.of(context).pushNamed('/map-screen',arguments: pageName);
},
                    ),
                    GestureDetector(
                      onTap: () {
                       // position[0]('longtude')=MapScreen.mapScreen.longtude;
                        submitForm(context);
                        Fluttertoast.showToast(
        msg: "Estate has been added Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );

    Navigator.of(context).pop();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(20),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange[400],
                            borderRadius: BorderRadius.circular(20)),
                        child: Text('Submit'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
