import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tos_parkovii/helper.dart';
import 'package:flutter/services.dart' show rootBundle;

class HousePage extends StatefulWidget {
  const HousePage({Key? key}) : super(key: key);

  @override
  State<HousePage> createState() => _HousePage();
}

class _HousePage extends State<HousePage> {
  final List<House> _houses = [];

  Future addHouse() async {
    var jsonData =
        await rootBundle.loadString('assets/test_json_for_map/houses.json');
    var data = json.decode(jsonData);

    data["house"].forEach((item) {
      _houses.add(House(
          iD: (item["ID"]),
          street: (item["street"]),
          number: item["number"],
          nameSenior: item["nameSenior"],
          surnameSenior: item["surnameSenior"],
          patronymicSenior: item["patronymicSenior"],
          shortNameSenior: item["shortNameSenior"],
          phoneNumber: item["phoneNumber"],
          company: item["company"],
          construction: item["construction"],
          longitude: item["longitude"],
          latitude: item["latitude"],
          photoSenior: item["photoSenior"]));
    });
    setState(() {});
  }

  var _filteredHouses = <House>[];

  final _searchController = TextEditingController();

//title&description search

  void _searchHouses() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredHouses = _houses.where((House house) {
        return house.street.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    if (query.isNotEmpty) {
      _filteredHouses = _houses.where((House house) {
        return house.surnameSenior.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredHouses = _houses;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredHouses = _houses;
    _searchController.addListener(_searchHouses);
    addHouse();
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
        backgroundColor: const Color.fromARGB(255, 23, 134, 34),
        title: const Text("Дома",
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
                  itemCount: _filteredHouses.length,
                  itemBuilder: (BuildContext context, int index) {
                    final house = _filteredHouses[index];

                    return GestureDetector(
                        //pressing with no response
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/h_details', arguments: house);
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
                                              color: Color.fromARGB(
                                                  170, 23, 134, 34)),
                                          padding: const EdgeInsets.all(3),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(house.number,
                                                textAlign: TextAlign.center,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontFamily: "Lato",
                                                    color: Colors.white)),
                                          ),
                                        )
                                      ]),
                                      title: Text(house.street,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontFamily: "Lato",
                                              color: Color.fromRGBO(
                                                  35, 33, 34, 1))),
                                      subtitle: Text(
                                          'Cтарший: ${house.shortNameSenior}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontFamily: "Lato",
                                              color: Color.fromRGBO(
                                                  35, 33, 34, 1))),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.chevron_right),
                                        color:
                                            const Color.fromRGBO(35, 33, 34, 1),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed('/h_details');
                                        },
                                      )),
                                )
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
