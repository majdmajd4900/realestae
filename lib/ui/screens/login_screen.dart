import 'package:firebase_login_app/ui/widgets/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:firebase_login_app/ui/widgets/above_side_login_page.dart';
import 'package:firebase_login_app/ui/widgets/bottom_side_login_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override

  Widget build(BuildContext context) {
   // UserSharedPreferences.userSharedPreferences.initializeSharedPref();
    print('before ff');
      
    return Column(children: <Widget>[
      AboveSideLoginPage(),
      Expanded(child: BottomSideLoginPage()),
    ]
    
    )
    ;
  }
}