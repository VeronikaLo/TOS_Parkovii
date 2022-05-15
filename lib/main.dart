// first test
// second test lily
// third test veronika

import 'package:flutter/material.dart';
import 'package:tos_parkovii/screens/house_detail.dart';
import 'package:tos_parkovii/screens/map_institute.dart';
import 'screens/area_detail.dart';
import 'screens/area_page.dart';
import 'screens/event_page.dart';
import 'screens/home_screen.dart';
import 'screens/house_page.dart';
import 'screens/institute_detail.dart';
import 'screens/institute_page.dart';
import 'screens/splash_screen.dart';
import 'screens/map_event.dart';
import 'screens/map_all_screen.dart';
import 'screens/event_detail.dart';
import 'screens/map_area.dart';
import 'screens/map_house.dart';
import 'screens/map_institute.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routes = <String, WidgetBuilder>{
    // The path that creates the Home Screen
    '/Home': (BuildContext context) => const HomeScreen(),
    '/area': (BuildContext context) => const AreaPage(),
    '/map': (BuildContext context) => const FifthPage(),
    '/map_all': (BuildContext context) => const FifthScreen(),
    '/event': (BuildContext context) => const EventPage(),
    '/house': (BuildContext context) => const HousePage(),
    '/institut': (BuildContext context) => const InstitutePage(),
    '/h_details': (BuildContext context) => const HouseDetail(),
    '/i_details': (BuildContext context) => const InstituteDetail(),
    '/a_details': (BuildContext context) => const AreaDetail(),
    '/e_details': (BuildContext context) => const EventDetail(),
    '/a_map': (BuildContext context) => const FifthPageArea(),
    '/h_map': (BuildContext context) => const FifthPageHouse(),
    '/i_map': (BuildContext context) => const FifthPageInstitute(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(nextRoute: '/Home'),
      // passing routes to the application
      routes: routes,
    );
  }
}
