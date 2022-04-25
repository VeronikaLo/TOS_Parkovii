import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);
  
 
  @override
  _NewScreenState createState() => _NewScreenState();
}
 

class _NewScreenState extends State<NewScreen> {
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third/ Test screen",),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:const <Widget>[
            Text('third page',),
          ],
        ),
      ),
    );
  }
}