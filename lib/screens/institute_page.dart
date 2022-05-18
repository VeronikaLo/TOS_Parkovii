import 'package:flutter/material.dart';
import 'package:tos_parkovii/helper.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';

class InstitutePage extends StatefulWidget {
  const InstitutePage({Key? key}) : super(key: key);

  @override
  State<InstitutePage> createState() => _InstitutePage();
}

class _InstitutePage extends State<InstitutePage> {
  final List<Institute> _institutes = [];

  Future addInstitute() async {
    var jsonData = await rootBundle.loadString('assets/json/institutes.json');
    var data = json.decode(jsonData);

    data["institute"].forEach((item) {
      _institutes.add(Institute(
          iD: (item["ID"]),
          title: (item["title"]),
          description: item["description"],
          type: item["type"],
          shortDescription: item["shortDescription"],
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

  var _filteredInstitutes = <Institute>[];

  final _searchController = TextEditingController();

  void _searchInstitutes() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredInstitutes = _institutes.where((Institute institute) {
        return institute.title.toLowerCase().contains(query.toLowerCase()) ||
            institute.street.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredInstitutes = _institutes;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredInstitutes = _institutes;
    _searchController.addListener(_searchInstitutes);
    addInstitute();
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
        backgroundColor: const Color.fromRGBO(214, 0, 0, 1),
        title: const Text("Организации",
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
                  itemCount: _filteredInstitutes.length,
                  itemBuilder: (BuildContext context, int index) {
                    final institute = _filteredInstitutes[index];

                    return GestureDetector(
                        //pressing with no response
                        onTap: () {
                          Navigator.of(context).pushNamed('/i_details',
                              arguments: _institutes[index]);
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
                                                    214, 0, 0, 0.7)),
                                            padding: const EdgeInsets.all(3),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(institute.type,
                                                  textAlign: TextAlign.center,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "Lato",
                                                      color: Colors.white)),
                                            ),
                                          ),
                                        ]),
                                        title: Text(institute.title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontFamily: "Lato",
                                                color: Color.fromRGBO(
                                                    35, 33, 34, 1))),
                                        subtitle: Text(institute.description,
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
                                                '/i_details',
                                                arguments: _institutes[index]);
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
