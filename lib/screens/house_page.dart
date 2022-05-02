import 'package:flutter/material.dart';

class House {
  final String title;
  final String description;
  final String amount;

  House({required this.title, required this.description, required this.amount});
}

class HousePage extends StatefulWidget {
  const HousePage({Key? key}) : super(key: key);

  @override
  State<HousePage> createState() => _HousePage();
}

class _HousePage extends State<HousePage> {
  final _houses = [
    House(
        title: 'Номер дома',
        description: 'Год постройки и тип постройки',
        amount: '100 жителей'),
    House(
        title: 'Номер дома',
        description: 'Год постройки и тип постройки',
        amount: '100 жителей'),
    House(
        title: 'Номер дома',
        description: 'Год постройки и тип постройки',
        amount: '100 жителей'),
    House(
        title: 'Номер дома',
        description: 'Год постройки и тип постройки',
        amount: '100 жителей'),
    House(
        title: 'Номер дома',
        description: 'Год постройки и тип постройки',
        amount: '100 жителей'),
    House(
        title: 'Номер дома',
        description: 'Год постройки и тип постройки',
        amount: '100 жителей'),
  ];

  var _filteredHouses = <House>[];

  final _searchController = TextEditingController();

  void _searchHouses() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredHouses = _houses.where((House house) {
        return house.title.toLowerCase().contains(query.toLowerCase());
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
        backgroundColor: const Color.fromRGBO(166, 197, 0, 1),
        title: const Text("Дома",
            style: TextStyle(color: Color.fromRGBO(35, 33, 34, 1))),
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
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: _filteredHouses.length,
                  itemBuilder: (BuildContext context, int index) {
                    final house = _filteredHouses[index];

                    return Container(
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
                                  title: Text(house.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontFamily: "Lato",
                                          color:
                                              Color.fromRGBO(35, 33, 34, 1))),
                                  subtitle: Text(house.description,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Lato",
                                          color:
                                              Color.fromRGBO(35, 33, 34, 1))),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.chevron_right),
                                    color: const Color.fromRGBO(35, 33, 34, 1),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('/h_details');
                                    },
                                  )),
                            )
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
