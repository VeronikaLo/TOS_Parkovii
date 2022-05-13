import 'package:flutter/material.dart';
import 'dart:core';

class InstituteDetail extends StatefulWidget {
  const InstituteDetail({Key? key}) : super(key: key);

  @override
  _InstituteDetailState createState() => _InstituteDetailState();
}

class _InstituteDetailState extends State<InstituteDetail> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(240, 240, 238, 1),
        appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                splashRadius: 50,
                splashColor: Colors.grey,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                tooltip: "Назад"),
            backgroundColor: const Color.fromRGBO(214, 0, 0, 1),
            title: const Text('Организации',
                style: TextStyle(
                    fontSize: 24, fontFamily: "Lato", color: Colors.white)),
            centerTitle: true),
        body: Column(
          children: const [
            Flexible(child: SingleChildScrollView(child: Text("заглушка")))
          ],
        ));
  }
}

class More {
  final String title;
  final String type;
  final String shortDescription;
  final String fullDescription;
  final String street;
  final String number;
  final dynamic latitude;
  final dynamic longitude;
  final String image;

  More(
      {required this.title,
      required this.type,
      required this.shortDescription,
      required this.fullDescription,
      required this.street,
      required this.number,
      required this.latitude,
      required this.longitude,
      required this.image});
}

final _mores = [
  More(
      title: 'Пенсионный Фонд Российской Федерации',
      type: 'Государственная',
      shortDescription: 'График работы: 8:00 - 20:00 /n тел.: 600-03-81',
      fullDescription:
          'Пенсионный фонд России (ПФР) является одним из трех государственных внебюджетных фондов, на которые возложены функции по обязательному социальному страхованию. Фонд выступает ключевым социальным институтом страны и крупнейшей федеральной системой оказания государственных услуг в области социального обеспечения.',
      street: 'Лейтейзена',
      number: '1В',
      latitude: '54.20018',
      longitude: '37.60324',
      image: '')
];
