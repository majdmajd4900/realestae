import 'dart:developer';

import 'package:firebase_login_app/provider/providers_.dart';
import 'package:firebase_login_app/ui/screens/adding_page.dart';
import 'package:firebase_login_app/ui/screens/city_control.dart';
import 'package:firebase_login_app/ui/screens/estate_details.dart';
import 'package:firebase_login_app/ui/screens/explore_estates.dart';
import 'package:firebase_login_app/ui/screens/firesore_test.dart';
import 'package:firebase_login_app/ui/screens/google_map.dart';
import 'package:firebase_login_app/ui/screens/home_page.dart';
import 'package:firebase_login_app/ui/screens/login_screen.dart';
import 'package:firebase_login_app/ui/screens/router.gr.dart';
import 'package:firebase_login_app/ui/screens/test.dart';
import 'package:firebase_login_app/ui/widgets/estate_image_slider.dart';
import 'package:firebase_login_app/ui/widgets/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

 bool x = await UserSharedPreferences.userSharedPreferences.getUserStatus();
  
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EstateAtrributeProvider()),
      ],
      child: MyApp(x),
    ),
  );
}


class MyApp extends StatelessWidget {
  bool x;
  MyApp(this.x);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if(x==true){
      Provider.of<EstateAtrributeProvider>(context,listen: false).getAllEstates();
    }
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
       
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: Router(),
      home: LoginPage() // x==true ? EstatePage() : LoginPage(),
    );
  }
}

