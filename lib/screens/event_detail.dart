import 'package:flutter/material.dart';
import 'package:tos_parkovii/helper.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({Key? key}) : super(key: key);

  @override
  State<EventDetail> createState() => _EventDetail();
}

class _EventDetail extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    final event = settings.arguments as Event;
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
            backgroundColor: const Color.fromRGBO(241, 136, 37, 1),
            title: const Text('Мероприятие',
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
                          event.title,
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
                          event.place,
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
                                  Text('Тип мероприятия:  ${event.type}',
                                      style: const TextStyle(
                                          fontSize: 16, fontFamily: "Lato")),
                                  Text('Дата:   ${event.date}',
                                      style: const TextStyle(
                                          fontSize: 16, fontFamily: "Lato")),
                                  Text('Время:   ${event.time}',
                                      style: const TextStyle(
                                          fontSize: 16, fontFamily: "Lato")),
                                ],
                              ),
                            ),
                            ElevatedButton.icon(
                              // <-- ElevatedButton
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('/map', arguments: event);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: const Color.fromRGBO(
                                      241, 136, 37, 1), // background
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
              Flexible(
                  flex: 2,
                  child: Image.network(
                    event.picture,
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
                            event.description,
                            style: const TextStyle(
                                fontSize: 16, fontFamily: "Lato"),
                            textAlign: TextAlign.center,
                          ))))
            ],
          ),
        ));
  }
}//для Вероники