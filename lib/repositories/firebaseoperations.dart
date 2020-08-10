import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class FirebaseOperations {
  FirebaseOperations._();
  static final FirebaseOperations firebaseOperations = FirebaseOperations._();
  final firestoreInstance = Firestore.instance;

  Future<dynamic> postImage(Asset imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = reference.putData((await imageFile.getByteData()).buffer.asUint8List());
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    print(storageTaskSnapshot.ref.getDownloadURL());
    return storageTaskSnapshot.ref.getDownloadURL();
  }

  Future <List<String>> uploadImage(List<Asset> pickedImages) async {
    List<String> imageUrls = [];
    try {
     //pickedImages = await MultiImagePicker.pickImages(maxImages: 10);
     for(var x=0; x<   pickedImages.length; ++x)
     imageUrls.add(await postImage(pickedImages[x]));
     return imageUrls;
     }catch (error) {
      print(error);
    }
   /*  }
      DateTime dateTime = DateTime.now();
      StorageTaskSnapshot snapshot = await firebaseStorage
          .ref()
          .child('products/$dateTime.jpg')
          .putFile(file)
          .onComplete;
      String imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;*/
    
  }

////City operations
  Future <List<DocumentSnapshot>> getPropertyCitiesFromDataBase() async {
    try {
      QuerySnapshot querySnapshot =
          await firestoreInstance.collection('cities').getDocuments();
   //       print(querySnapshot.documents.first.data);
         // print(querySnapshot.documents.toList());
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  addNewCity(Map data){
    try{
    firestoreInstance.collection('cities').add(data);
    }catch(error){
      print(error);
    }
  }
///// Types Operaitions
Future <List<DocumentSnapshot>> getPropertyTypeFromDataBase() async {
    try {
      QuerySnapshot querySnapshot =
          await firestoreInstance.collection('types').getDocuments();
   //       print(querySnapshot.documents.first.data);
         // print(querySnapshot.documents.toList());
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  addNewType(Map data){
    try{
    firestoreInstance.collection('types').add(data);
    }catch(error){
      print(error);
    }
  }

  addNewEstate(Map data){
    try{
    
    firestoreInstance.collection('estates').add(data);
    }catch(error){
      print(error);
    }
  }

Future <List<DocumentSnapshot>> getAllEstates() async {
    try {
      QuerySnapshot querySnapshot =
          await firestoreInstance.collection('estates').getDocuments();
   //       print(querySnapshot.documents.first.data);
         // print(querySnapshot.documents.toList());
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  Future <List<DocumentSnapshot>> queryByCity(String city) async {
    try {
      QuerySnapshot querySnapshot =
          await firestoreInstance.collection('estates')
          .where('city',isGreaterThanOrEqualTo: '${city[0]+city.substring(1)}')
          .where('city',isLessThan: '${city[0]+city.substring(1)}'+'z')
          .getDocuments();
   //       print(querySnapshot.documents.first.data);
         // print(querySnapshot.documents.toList());
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

}


