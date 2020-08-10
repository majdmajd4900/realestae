// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_login_app/ui/screens/login_screen.dart';
import 'package:firebase_login_app/ui/screens/home_page.dart';
import 'package:firebase_login_app/ui/screens/explore_estates.dart';
import 'package:firebase_login_app/ui/screens/estate_details.dart';
import 'package:firebase_login_app/ui/screens/city_control.dart';
import 'package:firebase_login_app/ui/screens/type_control.dart';
import 'package:firebase_login_app/ui/screens/adding_page.dart';
import 'package:firebase_login_app/ui/screens/google_map.dart';

class Routes {
  static const String loginPage = '/';
  static const String homePage = '/home-page';
  static const String estatePage = '/estate-page';
  static const String estateDetails = '/estate-details';
  static const String cityControl = '/city-control';
  static const String typeControl = '/type-control';
  static const String addingPage = '/adding-page';
  static const String mapScreen = '/map-screen';
  static const all = <String>{
    loginPage,
    homePage,
    estatePage,
    estateDetails,
    cityControl,
    typeControl,
    addingPage,
    mapScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginPage, page: LoginPage),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.estatePage, page: EstatePage),
    RouteDef(Routes.estateDetails, page: EstateDetails),
    RouteDef(Routes.cityControl, page: CityControl),
    RouteDef(Routes.typeControl, page: TypeControl),
    RouteDef(Routes.addingPage, page: AddingPage),
    RouteDef(Routes.mapScreen, page: MapScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    LoginPage: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginPage(),
        settings: data,
      );
    },
    HomePage: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
      );
    },
    EstatePage: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EstatePage(),
        settings: data,
      );
    },
    EstateDetails: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EstateDetails(),
        settings: data,
      );
    },
    CityControl: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CityControl(),
        settings: data,
      );
    },
    TypeControl: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => TypeControl(),
        settings: data,
      );
    },
    AddingPage: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddingPage(),
        settings: data,
      );
    },
    MapScreen: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MapScreen(),
        settings: data,
      );
    },
  };
}
