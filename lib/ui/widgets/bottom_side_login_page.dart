import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_app/firebase_client.dart';
import 'package:firebase_login_app/provider/providers_.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSideLoginPage extends StatelessWidget {
  TextEditingController emailEditingController;
  TextEditingController passwordEditingController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
           Container(color: Colors.white,
        child: ListView(children: <Widget>[
          Padding(padding : EdgeInsets.fromLTRB(50, 10, 100, 10), 
                      child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.person),
                ),
                Expanded(
                              child: TextField(
                                controller: emailEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter your user id',
                    
                    //border: OutlineInputBorder(
                      //borderRadius:BorderRadius.circular(20)
                      )
                      //)
                      ),
                ),

              ],
              ),
          ),
           Padding(padding : EdgeInsets.fromLTRB(50,10,100,1), 
                      child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.lock),
                ),
                Expanded(
                              child: TextField(
                                controller: passwordEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter your password'
                    //border: OutlineInputBorder(
                      //borderRadius:BorderRadius.circular(20)
                      )
                      //)
                      ),
                ),

              ],
              ),
          ),

          RaisedButton(child: Text('Tap to sign in'),onPressed: ()async{
           
//Auth.auth.loginUsingEmailAndPassword(emailEditingController.text, passwordEditingController.text);

            
          },),
          RaisedButton(child: Icon(Icons.g_translate),onPressed: () async {
           bool x = await Auth.auth.loginUsingGmail();
           if(x==true){
              await Provider.of<EstateAtrributeProvider>(context,listen: false).getAllEstates();
              Navigator.of(context).pushNamed('/estate-page');

           }else{
             print('check your email or password');
           }
          print(x);
          
          }),

          Row(children: <Widget>[
            Padding(
              padding:EdgeInsets.fromLTRB(10 , 10, 10, 1),
              child: Text('Dont Have an account?')),
            Padding(
              padding:EdgeInsets.fromLTRB(10, 10, 10, 1),
              child: Text('Sign  up'))
          ],)
            ]
        ),
      ),
    );
  }
}