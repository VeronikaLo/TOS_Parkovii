import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  // variable to store the route
  final String nextRoute;

  const SplashScreen({ Key? key, required this.nextRoute});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}
 

class _SplashScreenState extends State<SplashScreen> {
 
  // State initialization
  @override
  void initState() {
    super.initState();
    // Create a timer to switch SplashScreen to HomeScreen after some seconds.
    Timer(
      const Duration(seconds:4),
      () { Navigator.of(context).pushReplacementNamed(widget.nextRoute); }
    );
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:<Widget> [
          Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.jpg'),
              const SizedBox( height:45 ,),
              const Text('ТОС "Парковый"', style: TextStyle(fontSize: 32, fontFamily: 'AniconSans' ),),
              const SizedBox(height: 50,),
              Text('Вместе сможем больше!'.toUpperCase(), style: const TextStyle(fontSize: 22, letterSpacing: 2, fontFamily: 'AniconSans'),),
            ],
          ),
        ),
      ]
      ),
    );
  }
 
}