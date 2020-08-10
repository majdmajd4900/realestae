import 'package:firebase_login_app/models/estate_model.dart';
import 'package:firebase_login_app/provider/providers_.dart';
import 'package:firebase_login_app/ui/widgets/estate_card.dart';
import 'package:firebase_login_app/ui/widgets/search_bar.dart';
import 'package:firebase_login_app/ui/widgets/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../firebase_client.dart';

class EstatePage extends StatelessWidget {
  static List<EstateModel> estates = [];

  @override
  Widget build(BuildContext context) {
    //Provider.of<EstateAtrributeProvider>(context).estateQueryByCity();
    estates = Provider.of<EstateAtrributeProvider>(context).estates;
    //print(UserSharedPreferences.userSharedPreferences.prefs.getBool('isLoggeIn'));
    // print(estates[1].images.length);

    //print(estates[1].city);
    /*  estates.add(EstateModel(type: 'Apparment' , address: 'Gaza- Alnasert St , hmeed square', price: '20000'));
    estates.add(EstateModel(type: 'Apparment' , address: 'Gaza- Alnasert St , hmeed square', price: '20000'));
    estates.add(EstateModel(type: 'Apparment' , address: 'Gaza- Alnasert St , hmeed square', price: '20000'));
    estates.add(EstateModel(type: 'Apparment' , address: 'Gaza- Alnasert St , hmeed square', price: '20000'));
    estates.add(EstateModel(type: 'Apparment' , address: 'Gaza- Alnasert St , hmeed square', price: '20000'));
*/
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Controls'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
      ListTile(
        title: Text('Add new estate'),
        onTap: () {
          Navigator.of(context).pushNamed('/adding-page');
          // Update the state of the app.
          // ...
        },
      ),
      ListTile(
        title: Text('Sign Out'),
        onTap: () {
          Auth.auth.signOut();
          UserSharedPreferences.userSharedPreferences.insertIntoFile(false);
          Navigator.pushReplacementNamed(context, '/');
          // Update the state of the app.
          // ...
        },
      )],
          ),
        ),
        appBar: AppBar(
          title: Text('Explor Estates',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
              )),
          backgroundColor: Color.fromRGBO(236, 237, 239, 1),
          actions: <Widget>[
            CircleAvatar(child: Icon(FontAwesomeIcons.user))
          ],
        ),
        body: Column(
          children: <Widget>[
            SearchBar(),
            Expanded(
              child: ListView.builder(
                  itemCount: estates.length,
                  itemBuilder: (BuildContext context, int index) {
                    // print('jhj');

                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/estate-details',
                              arguments: estates[index]);
                        },
                        child: EstateCard(estates[index]));
                  }),
            )
          ],
        ));
  }
}
