import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login_app/models/estate_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FireBaseTestFireStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = {
      'gaza': 'tal el hawa',
      'gaza2': 'alnaser',
    };
    return Scaffold(
      appBar: AppBar(
        title: Text("Tesafds"),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: RaisedButton(onPressed: () async {
              EstateModel estateModel = EstateModel(
                  type: 'Appartment',
                  area: 150,
                  city: 'Gaza',
                  features: [
                    '3 Bedrooms',
                    '2 bathrooms',
                    'kitchent ',
                    'solar power for services'
                  ],
                  address: 'Alnaser Streer near Alshifa Tower',
                  price: 15000,
                  description:
                      'Wonderful view appartment on floor 6 with security and cameras');
              EstateModel(
                  type: 'Appartment',
                  area: 150,
                  city: 'Gaza',
                  features: [
                    '3 Bedrooms',
                    '2 bathrooms',
                    'kitchent ',
                    'solar power for services'
                  ],
                  address: 'Alnaser Streer near Alshifa Tower',
                  price: 15000);

              EstateModel(
                  type: 'Appartment',
                  area: 150,
                  city: 'Gaza',
                  features: [
                    '3 Bedrooms',
                    '2 bathrooms',
                    'kitchent ',
                    'solar power for services'
                  ],
                  address: 'Alnaser Streer near Alshifa Tower',
                  price: 15000);

              EstateModel(
                  type: 'Appartment',
                  area: 150,
                  city: 'Gaza',
                  features: [
                    '3 Bedrooms',
                    '2 bathrooms',
                    'kitchent ',
                    'solar power for services'
                  ],
                  address: 'Alnaser Streer near Alshifa Tower',
                  price: 15000);

              try {
                final firestore = Firestore.instance;
                firestore.settings(persistenceEnabled: true);

                firestore
                    .collection('properties')
                    .document()
                    .setData(estateModel.toJson());
                //  QuerySnapshot querySnapshot =
                //    await firestore.collection('cities').getDocuments();
                //print(json.encode(querySnapshot.documents.first.data));
                // estateModel = EstateModel.fromJson(querySnapshot);
                // print(estateModel.getEstateTitle());

              } catch (error) {
                print(error);
              }
            }),
          ),
          RaisedButton(onPressed: () async {
            
            final firestore = Firestore.instance;
            firestore.settings(persistenceEnabled: true);
            

            List<EstateModel> l = [];

            //firestore.collection('cities').document('Gaza').setData(estateModel.toJson());
                        print('before await 1');

            QuerySnapshot qs =
                await firestore.collection('properties').getDocuments();
                print('after await 1');
            List<DocumentSnapshot> ds = qs.documents;
            print('before await');
            l = await ds.map((e) => EstateModel.fromJson(e)).toList();
            print('after await');
            print(ds.map((e) => EstateModel.fromJson(e)).toList().length);
            //print(l[0].city);
/*
            PickedFile image =
                await ImagePicker().getImage(source: ImageSource.camera);
            File file = File(image.path);
            DateTime date = DateTime.now();
            StorageTaskSnapshot storageTaskSnapshot =await FirebaseStorage.instance
                .ref()
                .child('estateimages/$date.jpg')
                .putFile(file)
                .onComplete;
            
            String url = await storageTaskSnapshot.ref.getDownloadURL();
            print(url);*/
            //List<DocumentSnapshot> documentSnapshot = querySnapshot.documents;
            //List<EstateModel> models =
            //documentSnapshot.map((e) => EstateModel.fromJson(e));
            //  print(models);

            // print(EstateModel.fromJson(querySnapshot).getEstateType());
          })
        ],
      ),
    );
  }
}
