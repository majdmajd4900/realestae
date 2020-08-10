import 'package:firebase_login_app/ui/widgets/app_bar.dart';
import 'package:firebase_login_app/ui/widgets/filter_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: Text('مرحبا'),
          appBar: AppBar(),
          widgets: <Widget>[CircleAvatar(backgroundImage : NetworkImage('https://www.pavilionweb.com/wp-content/uploads/2017/03/man-300x300.png')),
          Icon(Icons.more_vert)],
        ),
        body:FilterBody() ,
    );
  }
}