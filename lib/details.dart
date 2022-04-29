import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  late final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 238, 1),
      appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: const Color.fromRGBO(35, 33, 34, 1),
              splashRadius: 50,
              splashColor: Colors.grey,
              onPressed: () {
                Navigator.of(context).pushNamed('/thirdPage');
              },
              tooltip: "Назад"),
          backgroundColor: const Color.fromRGBO(174, 213, 243, 1),
          title: const Text('Мероприятия',
              style: TextStyle(color: Color.fromRGBO(35, 33, 34, 1)))),
      body: Center(
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/fifthPage');
              },
              child: const Text("Смотреть на карте"))
          // child: Text('close'),
          // onPressed: () {
          //   Navigator.of(context).pop();
          // },
          ),
    );
  }
}
