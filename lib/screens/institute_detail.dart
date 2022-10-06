import 'package:flutter/material.dart';
import 'package:tos_parkovii/helper.dart';

class InstituteDetail extends StatefulWidget {
  const InstituteDetail({Key? key}) : super(key: key);

  @override
  _InstituteDetailState createState() => _InstituteDetailState();
}

class _InstituteDetailState extends State<InstituteDetail> {
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    final institute = settings.arguments as Institute;
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
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/background-details.jpg'),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 2,
                child: Container(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 10, left: 10, right: 10),
                    child: Column(
                      children: [
                        Text(
                          institute.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Lato"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          institute.street,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          institute.number,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Тип: ${institute.type}',
                                      style: const TextStyle(
                                          fontSize: 15, fontFamily: "Lato")),
                                  Text(
                                      'Описание: ${institute.shortDescription}',
                                      style: const TextStyle(
                                          fontSize: 15, fontFamily: "Lato")),
                                ],
                              ),
                            ),
                            ElevatedButton.icon(
                              // <-- ElevatedButton
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('/i_map', arguments: institute);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromRGBO(
                                      214, 0, 0, 1), // background
                                  foregroundColor: Colors.white, // foreground
                                  elevation: 5,
                                  fixedSize: const Size(125, 50)),
                              icon: const Icon(
                                Icons.pin_drop_outlined,
                                size: 30.0,
                              ),
                              label: const Text('Найти'),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
              Flexible(
                  flex: 2,
                  child: Image.network(
                    institute.image,
                    //height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              Flexible(
                  flex: 2,
                  child: SingleChildScrollView(
                      child: Container(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 10, left: 10, right: 10),
                          child: Text(
                            institute.fullDescription,
                            style: const TextStyle(
                                fontSize: 16, fontFamily: "Lato"),
                            textAlign: TextAlign.center,
                          ))))
            ],
          ),
        ));
  }
}
