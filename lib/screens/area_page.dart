import 'package:flutter/material.dart';
import 'package:tos_parkovii/helper.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;


class AreaPage extends StatefulWidget {
  const AreaPage({Key? key}) : super(key: key);

  @override
  State<AreaPage> createState() => _AreaPage();
}

class _AreaPage extends State<AreaPage> {
  final List<Area> _areas = [];
  Future addArea() async {
    var jsonData = await rootBundle.loadString('assets/json/areas.json');
    var data = json.decode(jsonData);

    data["area"].forEach((item) {
      _areas.add(Area(
          iD: (item["ID"]),
          title: (item["title"]),
          description: item["description"],
          type: item["type"],
          condition: item["condition"],
          financing: item["financing"],
          fullDescription: item["fullDescription"],
          street: item["street"],
          number: item["number"],
          longitude: item["longitude"],
          latitude: item["latitude"],
          image: item["image"]));
    });
    setState(() {});
  }

  //title&description search
  var _filteredAreas = <Area>[];

  final _searchController = TextEditingController();

  void _searchAreas() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredAreas = _areas.where((Area area) {
        return area.title.toLowerCase().contains(query.toLowerCase()) ||
            area.street.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredAreas = _areas;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredAreas = _areas;
    _searchController.addListener(_searchAreas);
    addArea();
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
        backgroundColor: const Color.fromRGBO(0, 58, 90, 1),
        title: const Text("Пространства",
            style: TextStyle(
                fontSize: 24, fontFamily: "Lato", color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                  itemCount: _filteredAreas.length,
                  itemBuilder: (BuildContext context, int index) {
                    final area = _filteredAreas[index];

                    return GestureDetector(
                        //pressing with no response
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/a_details', arguments: area);
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
                                                    0, 58, 90, 0.7)),
                                            padding: const EdgeInsets.all(3),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(area.condition,
                                                  textAlign: TextAlign.center,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 13,
                                                      fontFamily: "Lato",
                                                      color: Colors.white)),
                                            ),
                                          )
                                        ]),
                                        title: Text(area.title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontFamily: "Lato",
                                                color: Color.fromRGBO(
                                                    35, 33, 34, 1))),
                                        subtitle: Text(area.description,
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
                                                '/a_details',
                                                arguments: _areas[index]);
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
