import 'package:flutter/material.dart';
import 'package:wiki/pages.dart';
import 'package:wiki/screens/details_screen.dart';

import 'model/search.dart';

class PageRoutes {
  Route<dynamic> pages(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: settings,
        );
      case DetailScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => DetailScreen(searchedItem: settings.arguments),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  backgroundColor: Colors.red,
                  body: Center(
                    child: Text("Invalid Path"),
                  ),
                ));
    }
  }
}
