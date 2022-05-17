import 'package:flutter/material.dart';
import 'package:tos_parkovii/helper.dart';

class AreaPage extends StatefulWidget {
  const AreaPage({Key? key}) : super(key: key);

  @override
  State<AreaPage> createState() => _AreaPage();
}

class _AreaPage extends State<AreaPage> {
  final _areas = [
    Area(
        title: 'Музейный квартал',
        description: 'Тула - третья музейная столица',
        type: 'Общественное',
        condition: 'Действует',
        financing: 'Государственное',
        fullDescription:
            'Квартал представляет собой максимальную концентрацию самых значимых музеев и заповедников Тульской области. Здесь размещены филиалы «Куликова Поля», «Ясной Поляны», филиал Государственного исторического музея, Историко-краеведческого и художественного музея, а также музея и штаба Центрального казачьего войска. В Музейном квартале расположены также гостиница, кафе и магазины, галерея и новые пешеходные тропинки.',
        street: 'Металлистов',
        number: '14',
        latitude: 54.19874,
        longitude: 37.61669,
        image:
            'https://visittula.com/upload/resize_cache/iblock/481/700_600_2/481763edb9c2c91b0418165fe49bf2bb.jpg'),
    Area(
        title: 'Парк "Патриот"',
        description: 'Военная техника и тактические игры',
        type: 'Общественное',
        condition: 'Действует',
        financing: 'Государственное',
        fullDescription:
            'Миссия парка «Патриот-Тула»: стать местом притяжения жителей и гостей региона вокруг патриотических и семейных ценностей, чувства уважения и гордости за свою Родину, её историю, настоящее и будущее. Создание регионального парка «Патриот-Тула» позволит укрепить имидж Тульской области, как оружейной столицы России. Широкий спектр инфраструктурных возможностей парка, позволит привлечь на его территорию различные возрастные категории граждан, каждая из которых найдет для себя что-то интересное. График работы парка "Патриот - Тула": среда - воскресенье с 11.00 до 20.00 \n Телефон для справок: +7 (961) 266-77-82',
        street: 'Рязанская',
        number: '25/2',
        latitude: 54.18850,
        longitude: 37.65130,
        image:
            'http://tulskieparki.ru/assets/images/patriot/Fabrika-budushego/_DSC_0323.JPG'),
    Area(
        title: 'Парк "Патриот"',
        description: 'Военная техника и тактические игры',
        type: 'Общественное',
        condition: 'Действует',
        financing: 'Государственное',
        fullDescription:
            'Миссия парка «Патриот-Тула»: стать местом притяжения жителей и гостей региона вокруг патриотических и семейных ценностей, чувства уважения и гордости за свою Родину, её историю, настоящее и будущее. Создание регионального парка «Патриот-Тула» позволит укрепить имидж Тульской области, как оружейной столицы России. Широкий спектр инфраструктурных возможностей парка, позволит привлечь на его территорию различные возрастные категории граждан, каждая из которых найдет для себя что-то интересное. График работы парка "Патриот - Тула": среда - воскресенье с 11.00 до 20.00 \n Телефон для справок: +7 (961) 266-77-82',
        street: 'Рязанская',
        number: '25/2',
        latitude: 54.18850,
        longitude: 37.65130,
        image:
            'http://tulskieparki.ru/assets/images/patriot/Fabrika-budushego/_DSC_0323.JPG'),
    Area(
        title: 'Парк "Патриот"',
        description: 'Военная техника и тактические игры',
        type: 'Общественное',
        condition: 'Действует',
        financing: 'Государственное',
        fullDescription:
            'Миссия парка «Патриот-Тула»: стать местом притяжения жителей и гостей региона вокруг патриотических и семейных ценностей, чувства уважения и гордости за свою Родину, её историю, настоящее и будущее. Создание регионального парка «Патриот-Тула» позволит укрепить имидж Тульской области, как оружейной столицы России. Широкий спектр инфраструктурных возможностей парка, позволит привлечь на его территорию различные возрастные категории граждан, каждая из которых найдет для себя что-то интересное. График работы парка "Патриот - Тула": среда - воскресенье с 11.00 до 20.00 \n Телефон для справок: +7 (961) 266-77-82',
        street: 'Рязанская',
        number: '25/2',
        latitude: 54.18850,
        longitude: 37.65130,
        image:
            'http://tulskieparki.ru/assets/images/patriot/Fabrika-budushego/_DSC_0323.JPG'),
    Area(
        title: 'Парк "Патриот"',
        description: 'Военная техника и тактические игры',
        type: 'Общественное',
        condition: 'Действует',
        financing: 'Государственное',
        fullDescription:
            'Миссия парка «Патриот-Тула»: стать местом притяжения жителей и гостей региона вокруг патриотических и семейных ценностей, чувства уважения и гордости за свою Родину, её историю, настоящее и будущее. Создание регионального парка «Патриот-Тула» позволит укрепить имидж Тульской области, как оружейной столицы России. Широкий спектр инфраструктурных возможностей парка, позволит привлечь на его территорию различные возрастные категории граждан, каждая из которых найдет для себя что-то интересное. График работы парка "Патриот - Тула": среда - воскресенье с 11.00 до 20.00 \n Телефон для справок: +7 (961) 266-77-82',
        street: 'Рязанская',
        number: '25/2',
        latitude: 54.18850,
        longitude: 37.65130,
        image:
            'http://tulskieparki.ru/assets/images/patriot/Fabrika-budushego/_DSC_0323.JPG'),
    Area(
        title: 'Парк "Патриот"',
        description: 'Военная техника и тактические игры',
        type: 'Общественное',
        condition: 'Действует',
        financing: 'Государственное',
        fullDescription:
            'Миссия парка «Патриот-Тула»: стать местом притяжения жителей и гостей региона вокруг патриотических и семейных ценностей, чувства уважения и гордости за свою Родину, её историю, настоящее и будущее. Создание регионального парка «Патриот-Тула» позволит укрепить имидж Тульской области, как оружейной столицы России. Широкий спектр инфраструктурных возможностей парка, позволит привлечь на его территорию различные возрастные категории граждан, каждая из которых найдет для себя что-то интересное. График работы парка "Патриот - Тула": среда - воскресенье с 11.00 до 20.00 \n Телефон для справок: +7 (961) 266-77-82',
        street: 'Рязанская',
        number: '25/2',
        latitude: 54.18850,
        longitude: 37.65130,
        image:
            'http://tulskieparki.ru/assets/images/patriot/Fabrika-budushego/_DSC_0323.JPG'),
  ];
  //title&description search
  var _filteredAreas = <Area>[];

  final _searchController = TextEditingController();

  void _searchAreas() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredAreas = _areas.where((Area area) {
        return area.title.toLowerCase().contains(query.toLowerCase());
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
                          Navigator.of(context).pushNamed('/a_details',
                              arguments: _areas[index]);
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
