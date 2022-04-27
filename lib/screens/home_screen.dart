import 'dart:core';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// Creation a widget state
class _HomeScreenState extends State<HomeScreen> {
  final List _titles = ["Дома", "Мероприятия", "Пространства", "Организации", "Карта локаций"];
  final List _icons = [
    "assets/images/buildings.png",
    "assets/images/events.png",
    "assets/images/areas.png",
    "assets/images/companies.png",
    "assets/images/companies.png"
  ];

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/images/logo.jpg',
          color: const Color.fromRGBO(255, 255, 255, 0.3),
          colorBlendMode: BlendMode.modulate,
          fit: BoxFit.cover,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Выберите раздел",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 550,
                child: ListView.builder(
                    itemCount: _titles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: index == _selectedIndex
                              ? Colors.yellow[100]
                              : Colors.white,
                          border: Border.all(width: 2, color: Colors.grey),
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
                        margin: const EdgeInsets.symmetric(vertical: 7),
                        child: ListTile(
                          title: Text(
                            _titles[index],
                            style: const TextStyle(fontSize: 24, fontFamily: "Lato" ),
                          ),
                          leading: ImageIcon(
                            AssetImage(_icons[index]),
                            size: 50,
                            color: Colors.green,
                          ),
                          onTap: () {
                            setState(() {
                              // set selected index
                              _selectedIndex = index;
                              Navigator.of(context).pushNamed(_selectedIndex==4? "/fifthPage" : '/thirdPage');
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
