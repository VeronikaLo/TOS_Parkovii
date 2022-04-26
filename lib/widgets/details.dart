import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  late final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 238, 1),
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Color.fromRGBO(35, 33, 34, 1),
              splashRadius: 50,
              splashColor: Colors.grey,
              onPressed: () {
                Navigator.of(context).pushNamed('/thirdPage');
              },
              tooltip: "Назад"),
          backgroundColor: Color.fromRGBO(174, 213, 243, 1),
          title: Text('Мероприятия',
              style: TextStyle(color: Color.fromRGBO(35, 33, 34, 1)))),
      body: Center(child: Text('')
          // child: Text('close'),
          // onPressed: () {
          //   Navigator.of(context).pop();
          // },
          ),
    );
  }
}
