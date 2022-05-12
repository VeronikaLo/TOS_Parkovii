import 'package:flutter/material.dart';

class Detail {
  final String title;
  final String type;
  final String condition;
  final String financing;
  final String fullDescription;
  final String street;
  final String number;
  final dynamic latitude;
  final dynamic longitude;
  final String image;

  Detail(
      {required this.title,
      required this.type,
      required this.condition,
      required this.financing,
      required this.fullDescription,
      required this.street,
      required this.number,
      required this.latitude,
      required this.longitude,
      required this.image});
}

class InstituteDetail extends StatefulWidget {
  const InstituteDetail({Key? key}) : super(key: key);

  @override
  State<InstituteDetail> createState() => _InstituteDetail();
}

class _InstituteDetail extends State<InstituteDetail> {
  final _details = [
    Detail(
        title: 'Пенсионный Фонд Российской Федерации',
        type: 'Государственная',
        condition: '',
        financing: '',
        fullDescription: 'График работы: 8:00 - 20:00 /n тел.: 600-03-81',
        street: 'Лейтейзена',
        number: '1В',
        latitude: '54.20018',
        longitude: '37.60324',
        image: '')
  ];

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
            backgroundColor: const Color.fromRGBO(0, 58, 90, 1),
            title: const Text('Пространства',
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
