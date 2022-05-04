import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  // variable to store the route
  final String nextRoute;

  const SplashScreen({Key? key, required this.nextRoute});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // State initialization
  @override
  void initState() {
    super.initState();
    // Create a timer to switch SplashScreen to HomeScreen after some seconds.
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed(widget.nextRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/splash.jpg'),
              const SizedBox(
                height: 45,
              ),
              const Text(
                'ТОС "Парковый"',
                style: TextStyle(fontSize: 34, color: Colors.green, fontFamily: 'AniconSans', fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Вместе сможем больше!',
                style:  TextStyle(
                    fontSize: 22, letterSpacing: 2, fontFamily: 'AniconSans'),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
