import 'package:flutter/material.dart';
import 'package:tos_parkovii/helper.dart';

class HousePage extends StatefulWidget {
  const HousePage({Key? key}) : super(key: key);

  @override
  State<HousePage> createState() => _HousePage();
}

class _HousePage extends State<HousePage> {
  final _houses = [
    House(
      street: 'ул. Льва Толстого',
      number: '91',
      nameSenior: 'Александр',
      surnameSenior: "Касатиков",
      patronymicSenior: 'Юрьевич',
      shortNameSenior: 'Касатиков А.Ю.',
      phoneNumber: '+7(903)037 77 08',
      company: 'ООО "УК Южная"',
      construction: '1998',
      longitude: "37.603532",
      latitude: "54.184487",
      photoSenior: 'assets/images/default_photoSenior.png',
    ),
    House(
      street: 'ул. Фридриха Энгельса',
      number: '54',
      nameSenior: 'Пётр',
      surnameSenior: "Лаврентьев",
      patronymicSenior: 'Игнатьевич',
      shortNameSenior: 'Лаврентьев П.И.',
      phoneNumber: '+7(903)037 77 07',
      company: 'ООО "АСТЕК"',
      construction: '1999',
      longitude: 37.601862,
      latitude: 54.183158,
      photoSenior: 'assets/images/default_photoSenior.png',
    ),
    House(
      street: 'Первомайская ул.',
      number: '12',
      nameSenior: 'Анатолий',
      surnameSenior: "Вишневский",
      patronymicSenior: 'Анатольевич',
      shortNameSenior: 'Вишневский А.А.',
      phoneNumber: '+7(903)037 77 06',
      company: 'ООО "АДС Тулы"',
      construction: '1998',
      longitude: 37.601003,
      latitude: 54.182940,
      photoSenior: 'assets/images/default_photoSenior.png',
    ),
    House(
      street: 'ул. Софьи Перовской',
      number: '22',
      nameSenior: 'Валентин',
      surnameSenior: "Краско",
      patronymicSenior: 'Георгиевич',
      shortNameSenior: 'Краско В.Г.',
      phoneNumber: '+7(903)037 77 05',
      company: 'ООО "Велиград"',
      construction: '1998',
      longitude: 37.598701,
      latitude: 54.188528,
      photoSenior: 'assets/images/default_photoSenior.png',
    ),
    House(
      street: 'ул. Льва Толстого',
      number: '111',
      nameSenior: 'Евгения',
      surnameSenior: "Власова",
      patronymicSenior: 'Егоровна',
      shortNameSenior: 'Власова Е.Е.',
      phoneNumber: '+7(903)037 77 04',
      company: 'ООО "Велиград"',
      construction: '1998',
      longitude: 37.598582,
      latitude: 54.186727,
      photoSenior: 'assets/images/default_photoSenior.png',
    ),
    House(
      street: 'ул. Бундурина',
      number: '31',
      nameSenior: 'Егор',
      surnameSenior: "Пономарёв",
      patronymicSenior: 'Дмитриевич',
      shortNameSenior: 'Пономарёв Е.Д.',
      phoneNumber: '+7(903)037 77 03',
      company: 'ООО УК "Горизонт"',
      construction: '2000',
      longitude: 37.601274,
      latitude: 54.187304,
      photoSenior: 'assets/images/default_photoSenior.png',
    ),
    House(
      street: 'Гоголевская ул.',
      number: '65',
      nameSenior: 'Владимир',
      surnameSenior: "Ушков",
      patronymicSenior: 'Викторович',
      shortNameSenior: 'Ушков В.В.',
      phoneNumber: '+7(903)037 77 02',
      company: 'ООО "УК Аврора"',
      construction: '2001',
      longitude: 37.601919,
      latitude: 54.187915,
      photoSenior: 'assets/images/default_photoSenior.png',
    ),
    House(
      street: 'Первомайская ул.',
      number: '24',
      nameSenior: 'Ирина',
      surnameSenior: "Карасёва",
      patronymicSenior: 'Всеволодовна',
      shortNameSenior: 'Карасёва И.В.',
      phoneNumber: '+7(903)037 77 01',
      company: 'ООО "Евросити"',
      construction: '2003',
      longitude: 37.595859,
      latitude: 54.184920,
      photoSenior: 'assets/images/default_photoSenior.png',
    ),
    House(
      street: 'ул. Бундурина',
      number: '61',
      nameSenior: 'Виктор',
      surnameSenior: "Утконос",
      patronymicSenior: 'Васильевич',
      shortNameSenior: 'Утконос В.В.',
      phoneNumber: '+7(903)037 77 00',
      company: 'ООО УК "Жилхоз"',
      construction: '1997',
      longitude: 37.597966,
      latitude: 54.184211,
      photoSenior: 'assets/images/default_photoSenior.png',
    ),
    House(
      street: 'ул. Свободы',
      number: '35',
      nameSenior: 'Роман',
      surnameSenior: "Калашников",
      patronymicSenior: 'Николаевич',
      shortNameSenior: 'Калашников Р.Н.',
      phoneNumber: '+7(903)037 77 89',
      company: 'ООО УК "ЗелинГрад"',
      construction: '1998',
      longitude: 37.603741,
      latitude: 54.186778,
      photoSenior: 'assets/images/default_photoSenior.png',
    ),
  ];
  //title&description search
  var _filteredHouses = <House>[];

  final _searchController = TextEditingController();

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
