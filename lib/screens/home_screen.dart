import 'dart:core';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// Creation a widget state
class _HomeScreenState extends State<HomeScreen> {
  final List _titles = [
    "Дома",
    "Мероприятия",
    "Пространства",
    "Организации",
    "Карта локаций"
  ];
  final List _icons = [
    "assets/images/buildings.png",
    "assets/images/events.png",
    "assets/images/areas.png",
    "assets/images/companies.png",
    "assets/images/maps.png"
  ];
  final List<Color> _colors = const [
    Color.fromARGB(255, 23, 134, 34),
    Color.fromRGBO(241, 136, 37, 1),
    Color.fromRGBO(0, 58, 90, 1),
    Color.fromRGBO(214, 0, 0, 1),
    Color.fromRGBO(247, 222, 28, 1)
  ];

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: double.infinity,
          child: Image.asset(
            'assets/images/background-homepage.jpg',
            color: const Color.fromRGBO(255, 255, 255, 0.3),
            colorBlendMode: BlendMode.modulate,
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Выберите раздел",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 58, 90, 1),
                ),
              ),
              //const SizedBox(
               // height: 20,
              //),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 550,
                child: ListView.builder(
                    itemCount: _titles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: _colors[index],
                          //border: Border.all(width: 2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepPurple.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset: const Offset(3, 3),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        height: 80,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(
                            _titles[index],
                            style: const TextStyle(
                                fontSize: 26,
                                fontFamily: "Lato",
                                color: Colors.white),
                          ),
                          leading: ImageIcon(
                            AssetImage(_icons[index]),
                            size: 65,
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              // set selected index
                              _selectedIndex = index;

                              switch(_selectedIndex){
        
                                case 0: 
                                    Navigator.of(context).pushNamed('/house');
                                    break;
                                case 1: 
                                    Navigator.of(context).pushNamed('/event');
                                    break;
                                case 2: 
                                    Navigator.of(context).pushNamed('/area');
                                    break;
                                case 3: 
                                    Navigator.of(context).pushNamed('/institut');
                                    break;
                                case 4: 
                                    Navigator.of(context).pushNamed('/map_all');
                                    break;   
                              }
                            });
                          },
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
