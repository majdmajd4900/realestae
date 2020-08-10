import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Features {
  String name;
  Icon icon;

  Features({this.name, this.icon});

  featureToJson(){
    return{
      'name': this.name,
      'icon': this.icon,
    };
  }

  Features.documentSnapShot(DocumentSnapshot documentSnapshot){
    this.name = documentSnapshot.data['name'];
    this.icon = documentSnapshot.data['icon'];
  }

}