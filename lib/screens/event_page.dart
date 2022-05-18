import 'package:flutter/material.dart';
import 'package:tos_parkovii/helper.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;


class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final List<Event> _events = [];
  
  Future addEvent() async {
    var jsonData = await rootBundle.loadString('assets/json/events.json');
    var data = json.decode(jsonData);

    data["events"].forEach((item) {
      _events.add(Event(
          iD: item["ID"],
          title: item["title"],
          place: item["place"],
          description: item["description"],
          time: item["time"],
          date: item["date"],
          type: item["type"],
          longitude: item["longitude"],
          latitude: item["latitude"],
          picture: item["picture"]));
    });
    setState(() {});
  }
  
  
  //title&description search
  var _filteredEvents = <Event>[];

  final _searchController = TextEditingController();

  void _searchEvents() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredEvents = _events.where((Event event) {
        return event.title.toLowerCase().contains(query.toLowerCase()) || event.place.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }else {
      _filteredEvents = _events;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredEvents = _events;
    _searchController.addListener(_searchEvents);
    addEvent();
  }

  @override
  Widget build(BuildContext context) {
    var bottom = MediaQuery.of(context).viewInsets.bottom;
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
              Navigator.of(context).pushNamed('/Home');
            },
            tooltip: "На главную"),
        backgroundColor: const Color.fromRGBO(241, 136, 37, 1),
        title: const Text('Мероприятия',
            style: TextStyle(
                fontSize: 24, fontFamily: "Lato", color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
          width: 395,
          height: 700,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background-thirdpage.jpg'),
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              ListView.builder(
                  padding: const EdgeInsets.only(top: 80),
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
                      .onDrag, //Hide keyboard on scroll
                  itemCount: _filteredEvents.length,
                  itemBuilder: (BuildContext context, int index) {
                    final event = _filteredEvents[index];
                    return GestureDetector(
                        //pressing with no response
                        onTap: () {
                          Navigator.of(context).pushNamed('/e_details',
                              arguments: _events[index]);
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            alignment: FractionalOffset.bottomRight,
                            child: Column(
                              children: [
                                Container(
                                    height: 67,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    child: ListTile(
                                        leading: Column(children: <Widget>[
                                          Container(
                                            height: 51,
                                            width: 51,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                color: Color.fromRGBO(
                                                    241, 136, 37, 0.7)),
                                            padding: const EdgeInsets.all(3),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(event.date,
                                                  textAlign: TextAlign.center,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "Lato",
                                                      color: Colors.white)),
                                            ),
                                          )
                                        ]),
                                        title: Text(event.title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontFamily: "Lato",
                                                color: Color.fromRGBO(
                                                    35, 33, 34, 1))),
                                        subtitle: Text(event.place,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontFamily: "Lato",
                                                color: Color.fromRGBO(
                                                    35, 33, 34, 1))),
                                        trailing: IconButton(
                                          icon: const Icon(Icons.chevron_right),
                                          color: const Color.fromRGBO(
                                              35, 33, 34, 1),
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(
                                                '/e_details',
                                                arguments: _events[index]);
                                          },
                                        ))),
                              ],
                            )));
                  }),
              Padding(
                padding: EdgeInsets.only(bottom: bottom),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.search,
                      ),
                    ),
                    hintText: ' Поиск ',
                    hintStyle: const TextStyle(
                        fontSize: 15.0, color: Color.fromRGBO(35, 33, 34, 1)),
                    filled: true,
                    fillColor: Colors.white.withAlpha(235),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
