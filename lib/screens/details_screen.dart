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
                Navigator.of(context).pushNamed('/Home');
              },
              tooltip: "Назад"),

          // Необходимо показать title и цвет background в зависимости от предыдущих действий
          backgroundColor: const Color.fromRGBO(174, 213, 243, 1),
          title: const Text('ЗАГЛУШКА',
              style: TextStyle(color: Color.fromRGBO(35, 33, 34, 1)))),
      body: Container(
          width: 395,
          height: 700,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background-details.jpg'),
                  fit: BoxFit.cover)),
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/map');
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
