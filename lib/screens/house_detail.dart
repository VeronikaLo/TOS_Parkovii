import 'package:flutter/material.dart';

class Detail {
  final String title;
  final String description;

  Detail({required this.title, required this.description});
}

class HouseDetail extends StatefulWidget {
  const HouseDetail({Key? key}) : super(key: key);

  @override
  State<HouseDetail> createState() => _HouseDetail();
}

class _HouseDetail extends State<HouseDetail> {
  final _details = [
    Detail(
      title: 'Данные дома: Test search 15, пр-кт Кирова',
      description: 'Пояснение: номер и улица',
    ),
    Detail(
      title: 'Данные дома: 15, пр-кт Кирова',
      description: 'Пояснение: номер и улица',
    ),
    Detail(
      title: 'Данные дома: 15, пр-кт Кирова',
      description: 'Пояснение: номер и улица',
    ),
    Detail(
      title: 'Данные дома: 15, пр-кт Кирова',
      description: 'Пояснение: номер и улица',
    ),
    Detail(
      title: 'Данные дома: 15, пр-кт Кирова',
      description: 'Пояснение: номер и улица',
    ),
    Detail(
      title: 'Данные дома: 15, пр-кт Кирова',
      description: 'Пояснение: номер и улица',
    ),
    Detail(
      title: 'Данные дома: 15, пр-кт Кирова',
      description: 'Пояснение: номер и улица',
    ),
    Detail(
      title: 'Данные дома: 15, пр-кт Кирова',
      description: 'Пояснение: номер и улица',
    )
  ];

  var _filteredDetails = <Detail>[];

  final _searchController = TextEditingController();

  void _searchDetails() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredDetails = _details.where((Detail detail) {
        return detail.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredDetails = _details;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredDetails = _details;
    _searchController.addListener(_searchDetails);
  }

  @override
  Widget build(BuildContext context) {
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
              Navigator.of(context).pop();
            },
            tooltip: "Назад"),
        backgroundColor: const Color.fromRGBO(166, 197, 0, 1),
        title: const Text('Дома',
            style: TextStyle(color: Color.fromRGBO(35, 33, 34, 1))),
        centerTitle: true,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background-details.jpg'),
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              ListView.builder(
                  padding: const EdgeInsets.only(top: 80),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: _filteredDetails.length,
                  itemBuilder: (BuildContext context, int index) {
                    final detail = _filteredDetails[index];

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
                                  title: Text(detail.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontFamily: "Lato",
                                          color:
                                              Color.fromRGBO(35, 33, 34, 1))),
                                  subtitle: Text(detail.description,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Lato",
                                          color:
                                              Color.fromRGBO(35, 33, 34, 1))),
                                  trailing: IconButton(
                                      icon: const Icon(
                                          Icons.chevron_right_outlined),
                                      color:
                                          const Color.fromRGBO(35, 33, 34, 1),
                                      onPressed: () {
                                        Navigator.of(context).pushNamed('/map');
                                      },
                                      tooltip: "Перейти к карте"),
                                )),
                          ],
                        ));
                  }),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
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
