import 'package:flutter/material.dart';

class Event {
  final String title;
  final String description;
  final String time;

  Event({required this.title, required this.description, required this.time});
}

class ThirdPage extends StatefulWidget {
  ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final _events = [
    Event(
      title: 'Название мероприятия',
      description: 'Краткое описание мероприятия',
      time: '25 мая 2022',
    ),
    Event(
      title: 'Название asdf мероприятия',
      description: 'Краткое описание мероприятия',
      time: '25 мая 2022',
    ),
    Event(
      title: 'Название мероприятия',
      description: 'Краткое описание мероприятия',
      time: '25 мая 2022',
    ),
    Event(
      title: 'Название мероприятия',
      description: 'Краткое описание мероприятия',
      time: '25 мая 2022',
    ),
    Event(
      title: 'Название мероприятия',
      description: 'Краткое описание мероприятия',
      time: '25 мая 2022',
    ),
    Event(
      title: 'Название мероприятия',
      description: 'Краткое описание мероприятия',
      time: '25 мая 2022',
    ),
    Event(
      title: 'Название мероприятия',
      description: 'Краткое описание мероприятия',
      time: '25 мая 2022',
    ),
    Event(
      title: 'Название мероприятия',
      description: 'Краткое описание мероприятия',
      time: '25 мая 2022',
    ),
    Event(
      title: 'Название мероприятия',
      description: 'Краткое описание мероприятия',
      time: '25 мая 2022',
    ),
    Event(
      title: 'Название мероприятия',
      description: 'Краткое описание мероприятия',
      time: '25 мая 2022',
    ),
    Event(
      title: 'Название мероприятия',
      description: 'Краткое описание мероприятия',
      time: '25 мая 2022',
    )
  ];
  int _selectedIndex = -1;

  var _filteredEvents = <Event>[];

  final _searchController = TextEditingController();

  void _searchEvents() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredEvents = _events.where((Event event) {
        return event.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredEvents = _events;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredEvents = _events;
    _searchController.addListener(_searchEvents);
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
            color: const Color.fromRGBO(35, 33, 34, 1),
            splashRadius: 50,
            splashColor: Colors.grey,
            onPressed: () {
              Navigator.of(context).pushNamed('/Home');
            },
            tooltip: "На главную"),
        backgroundColor: const Color.fromRGBO(174, 213, 243, 1),
        title: const Text("Мероприятия",
            style: TextStyle(color: Color.fromRGBO(35, 33, 34, 1))),
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
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: _filteredEvents.length,
                  itemBuilder: (BuildContext context, int index) {
                    final event = _filteredEvents[index];
                    return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        alignment: FractionalOffset.bottomRight,
                        child: Column(
                          children: [
                            Container(
                                height: 67,
                                decoration: BoxDecoration(
                                  color: index == _selectedIndex
                                      ? Colors.grey
                                      : Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                ),
                                child: ListTile(
                                  title: Text(event.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                  subtitle: Text(event.description,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                  trailing: const Icon(Icons.next_plan),
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = index;
                                      Navigator.of(context)
                                          .pushNamed('/details');
                                    });
                                  },
                                )),
                          ],
                        ));
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