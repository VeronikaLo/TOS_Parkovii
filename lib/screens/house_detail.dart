import 'package:flutter/material.dart';
import 'package:tos_parkovii/helper.dart';

class HouseDetail extends StatefulWidget {
  const HouseDetail({Key? key}) : super(key: key);

  @override
  State<HouseDetail> createState() => _HouseDetail();
}

class _HouseDetail extends State<HouseDetail> {
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    final house = settings.arguments as House;
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
          backgroundColor: const Color.fromARGB(255, 23, 134, 34),
          title: Text(house.street + ', ' + house.number,
              style: const TextStyle(
                  fontSize: 24, fontFamily: "Lato", color: Colors.white)),
          centerTitle: true,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background-details.jpg'),
                  fit: BoxFit.cover)),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    height: 250.0,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //'Старший'
                        const Text('Старший',
                            style: TextStyle(fontFamily: 'Lato', fontSize: 21)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 170,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage(house.photoSenior)))),
                              //и фио с телефоном
                              DataTable(
                                  columnSpacing: 20,
                                  horizontalMargin: 10,
                                  columns: <DataColumn>[
                                    const DataColumn(
                                      label: Text(
                                        'Фамилия',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        house.surnameSenior,
                                        style: const TextStyle(
                                            fontFamily: 'Lato', fontSize: 15),
                                      ),
                                    )
                                  ],
                                  rows: <DataRow>[
                                    DataRow(
                                      cells: <DataCell>[
                                        const DataCell(Text('Имя',
                                            style: TextStyle(
                                                fontFamily: 'Lato',
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold))),
                                        DataCell(Text(house.nameSenior,
                                            style: const TextStyle(
                                                fontFamily: 'Lato',
                                                fontSize: 15))),
                                      ],
                                    ),
                                    DataRow(
                                      cells: <DataCell>[
                                        const DataCell(Text('Отчество',
                                            style: TextStyle(
                                                fontFamily: 'Lato',
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold))),
                                        DataCell(Text(house.patronymicSenior,
                                            style: const TextStyle(
                                                fontFamily: 'Lato',
                                                fontSize: 15))),
                                      ],
                                    ),
                                    DataRow(
                                      cells: <DataCell>[
                                        const DataCell(Text('Контакт',
                                            style: TextStyle(
                                                fontFamily: 'Lato',
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold))),
                                        DataCell(Text(house.phoneNumber,
                                            style: const TextStyle(
                                                fontFamily: 'Lato',
                                                fontSize: 15))),
                                      ],
                                    ),
                                  ])
                            ])
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        //'информация о доме'
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Информация о доме',
                                style: TextStyle(
                                    fontFamily: 'Lato', fontSize: 21)),
                            ElevatedButton.icon(
                              // <-- ElevatedButton
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('/h_map', arguments: house);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                      255, 23, 134, 34), // background
                                  foregroundColor: Colors.white, // foreground
                                  elevation: 5,
                                  fixedSize: const Size(125, 50)),
                              icon: const Icon(
                                Icons.pin_drop_outlined,
                                size: 30.0,
                              ),
                              label: const Text('Найти'),
                            ),
                          ],
                        ),
                        Row(children: [
                          DataTable(
                            columnSpacing: 45,
                            columns: <DataColumn>[
                              const DataColumn(
                                  label: Text('Год постройки',
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text(house.construction,
                                      style: const TextStyle(
                                          fontFamily: 'Lato', fontSize: 15)))
                            ],
                            rows: <DataRow>[
                              DataRow(cells: <DataCell>[
                                const DataCell(Text('УК',
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                                DataCell(Text(house.company,
                                    style: const TextStyle(
                                        fontFamily: 'Lato', fontSize: 15))),
                              ])
                            ],
                          ),
                        ])
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 15, left: 15),
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Капитальный ремонт',
                        style: TextStyle(fontFamily: 'Lato', fontSize: 21)),
                    const SizedBox(
                      height: 13,
                    ),
                    DataTable(columns: const <DataColumn>[
                      DataColumn(
                          label: Text('Вид работ',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Год',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Статус',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold))),
                    ], rows: const <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Крыша',
                              style:
                                  TextStyle(fontFamily: 'Lato', fontSize: 15))),
                          DataCell(Text('2020',
                              style:
                                  TextStyle(fontFamily: 'Lato', fontSize: 15))),
                          DataCell(
                            Icon(
                              Icons.check_outlined,
                              color: Colors.green,
                              size: 25,
                            ),
                          )
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Фасад',
                              style:
                                  TextStyle(fontFamily: 'Lato', fontSize: 15))),
                          DataCell(Text('2024',
                              style:
                                  TextStyle(fontFamily: 'Lato', fontSize: 15))),
                          DataCell(
                            Icon(
                              Icons.close_outlined,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Электрика',
                              style:
                                  TextStyle(fontFamily: 'Lato', fontSize: 15))),
                          DataCell(Text('2021',
                              style:
                                  TextStyle(fontFamily: 'Lato', fontSize: 15))),
                          DataCell(
                            Icon(
                              Icons.check_outlined,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Вода',
                              style:
                                  TextStyle(fontFamily: 'Lato', fontSize: 15))),
                          DataCell(Text('2020',
                              style:
                                  TextStyle(fontFamily: 'Lato', fontSize: 15))),
                          DataCell(
                            Icon(
                              Icons.check_outlined,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Канализация',
                              style:
                                  TextStyle(fontFamily: 'Lato', fontSize: 15))),
                          DataCell(Text('2025',
                              style:
                                  TextStyle(fontFamily: 'Lato', fontSize: 15))),
                          DataCell(
                            Icon(
                              Icons.close_outlined,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Отопление',
                              style:
                                  TextStyle(fontFamily: 'Lato', fontSize: 15))),
                          DataCell(Text('2019',
                              style:
                                  TextStyle(fontFamily: 'Lato', fontSize: 15))),
                          DataCell(
                            Icon(
                              Icons.check_outlined,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Газ',
                              style:
                                  TextStyle(fontFamily: 'Lato', fontSize: 15))),
                          DataCell(Text('2022',
                              style:
                                  TextStyle(fontFamily: 'Lato', fontSize: 15))),
                          DataCell(
                            Icon(
                              Icons.close_outlined,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ])
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
