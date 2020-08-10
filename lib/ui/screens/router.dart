import 'package:auto_route/auto_route_annotations.dart';
import 'package:firebase_login_app/ui/screens/adding_page.dart';
import 'package:firebase_login_app/ui/screens/city_control.dart';
import 'package:firebase_login_app/ui/screens/estate_details.dart';
import 'package:firebase_login_app/ui/screens/explore_estates.dart';
import 'package:firebase_login_app/ui/screens/home_page.dart';
import 'package:firebase_login_app/ui/screens/login_screen.dart';
import 'package:firebase_login_app/ui/screens/type_control.dart';
import 'package:firebase_login_app/ui/screens/google_map.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: LoginPage, initial: true),
    MaterialRoute(page: HomePage,),
    MaterialRoute(page: EstatePage,),
    MaterialRoute(page: EstateDetails,),
    MaterialRoute(page: CityControl,),
    MaterialRoute(page: TypeControl,),
    MaterialRoute(page: AddingPage,),
    MaterialRoute(page: MapScreen,),



  ],
)
class $Router{}