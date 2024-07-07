import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';
import '../screens/repo_details/repo_detail_screen.dart';
import 'routes_names.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.homeRoute:
      return MaterialPageRoute(
          builder: (context) => const HomeScreen(), settings: settings);

    case Routes.repoDetailsRoute:
      var args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
          builder: (context) => RepoDetailsScreen(
                ownerName: args['ownerName'],
                repoName: args['repoName'],
              ),
          settings: settings);

    default:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
