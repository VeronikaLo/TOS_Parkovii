import 'package:flutter/material.dart';
import 'package:tos_parkovii/helper.dart';

class AreaDetail extends StatefulWidget {
  const AreaDetail({Key? key}) : super(key: key);

  @override
  State<AreaDetail> createState() => _AreaDetail();
}

class _AreaDetail extends State<AreaDetail> {
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    final area = settings.arguments as Area;
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
                          area.title,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Lato"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          area.street,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          area.number,
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
                                  Text('Финансирование: ${area.financing}',
                                      style: const TextStyle(
                                          fontSize: 15, fontFamily: "Lato")),
                                  Text('Состояние: ${area.condition}',
                                      style: const TextStyle(
                                          fontSize: 15, fontFamily: "Lato")),
                                  Text('Тип: ${area.type}',
                                      style: const TextStyle(
                                          fontSize: 15, fontFamily: "Lato")),
                                ],
                              ),
                            ),
                            ElevatedButton.icon(
                              // <-- ElevatedButton
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('/a_map', arguments: area);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: const Color.fromRGBO(
                                      0, 58, 90, 1), // background
                                  onPrimary: Colors.white, // foreground
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
              const SizedBox(height: 20),
              Flexible(
                  flex: 2,
                  child: Image.network(
                    area.image,
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
                            area.fullDescription,
                            style: const TextStyle(
                                fontSize: 16, fontFamily: "Lato"),
                            textAlign: TextAlign.center,
                          ))))
            ],
          ),
        ));
  }
}
