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
              const Text('ТОС "Парковый"',
                  style: TextStyle(
                      fontSize: 42,
                      letterSpacing: 2,
                      fontFamily: 'Aerovista',
                      color: Color.fromRGBO(27, 138, 1, 1))),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Вместе сможем больше',
                    style: TextStyle(
                        fontSize: 32,
                        letterSpacing: 1.5,
                        fontFamily: 'Aerovista',
                        color: Color.fromRGBO(32, 85, 148, 1)),
                  ),
                  Text(
                    '!'.toUpperCase(),
                    style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        fontSize: 32,
                        letterSpacing: 1,
                        fontFamily: 'Anicon Sans',
                        color: Color.fromRGBO(32, 85, 148, 1)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
