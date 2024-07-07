import 'package:flutter/material.dart';


import '../screens/home/home_screen.dart';
import 'routes_names.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.homeRoute:
      return MaterialPageRoute(
          builder: (context) => const HomeScreen(), settings: settings);

    default:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}