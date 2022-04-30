// first test
// second test lily
// third test veronika

import 'package:flutter/material.dart';
import 'screens/area_page.dart';
import 'screens/details_screen.dart';
import 'screens/event_page.dart';
import 'screens/home_screen.dart';
import 'screens/house_page.dart';
import 'screens/institute_page.dart';
import 'screens/splash_screen.dart';
import 'screens/map_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routes = <String, WidgetBuilder>{
    // The path that creates the Home Screen
    '/Home': (BuildContext context) => const HomeScreen(),
    '/area': (BuildContext context) => const AreaPage(),
    '/details': (BuildContext context) => DetailPage(),
    '/map': (BuildContext context) => const FifthPage(),
    '/event': (BuildContext context) => const EventPage(),
    '/house': (BuildContext context) => const HousePage(),
    '/institut': (BuildContext context) => const InstitutePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(nextRoute: '/Home'),
      // passing routes to the application
      routes: routes,
    );
  }
}
