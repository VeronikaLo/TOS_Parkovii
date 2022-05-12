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

class AreaDetail extends StatefulWidget {
  const AreaDetail({Key? key}) : super(key: key);

  @override
  State<AreaDetail> createState() => _AreaDetail();
}

class _AreaDetail extends State<AreaDetail> {
  final _details = [
    Detail( //дополнить
        title: '',
        type: '',
        condition: '',
        financing: '',
        fullDescription: '',
        street: '',
        number: '',
        latitude: '',
        longitude: '',
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
