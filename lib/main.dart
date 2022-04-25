// first test
// second test lily
// third test veronika

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/test_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 MyApp({Key? key}) : super(key: key);

  final routes = <String, WidgetBuilder>{
    // The path that creates the Home Screen
    '/Home': (BuildContext context) => const HomeScreen(),
    '/Third': (BuildContext context) => const NewScreen()
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