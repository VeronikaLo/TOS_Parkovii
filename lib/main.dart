// first test
// second test lily
// third test veronika

import 'package:flutter/material.dart';
import 'package:tos_parkovii/details.dart';
import 'package:tos_parkovii/event_page.dart';
import 'area_page.dart';
import 'house_page.dart';
import 'institute_page.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';
import 'package:tos_parkovii/fifth_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routes = <String, WidgetBuilder>{
    // The path that creates the Home Screen
    '/Home': (BuildContext context) => const HomeScreen(),
    '/eventPage': (BuildContext context) => const EventPage(),
    '/details': (BuildContext context) => DetailPage(),
    '/fifthPage': (BuildContext context) => const FifthPage(),
    '/areaPage': (BuildContext context) => const AreaPage(),
    '/institutePage': (BuildContext context) => const InstitutePage(),
    '/housePage': (BuildContext context) => const HousePage(),
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
