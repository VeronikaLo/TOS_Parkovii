import 'package:flutter/material.dart';
import 'package:tos_parkovii/helper.dart';

class InstitutePage extends StatefulWidget {
  const InstitutePage({Key? key}) : super(key: key);

  @override
  State<InstitutePage> createState() => _InstitutePage();
}

class _InstitutePage extends State<InstitutePage> {
  final _institutes = [
    Institute(
      title: 'Ассоциация «СМО Тульской области»',
      description: 'Объединение местных самоуправлений',
      type: 'НКО',
      shortDescription: '+7(487)255-46-50',
      fullDescription:
          'Ассоциация «Совет муниципальных образований Тульской области» является объединением муниципальных образований Тульской области в целях обеспечения защиты прав муниципальных образований, являющихся членами Совета, и представления их общих интересов, а также обеспечения координации деятельности членов Совета по развитию правовой, организационной, финансово-экономической и территориальной основ местного самоуправления в Тульской области.Главная задача Совета — содействие развитию местного самоуправления на территории Тульской области.Приоритетные направления деятельности Совета:участие в законодательном и нормативном регулировании муниципальной деятельности в Тульской области;правовое консультирование и правовая защита интересов муниципальных образований, руководителей органов местного самоуправления;изучение и распространение лучших практик муниципального управления;организация предоставления методической помощи муниципальным образованиям;участие в организации системы подготовки и переподготовки;организация конкурсной деятельности на звание лучшего муниципального образования, лучшего главы, лучшего муниципального служащего;предоставление аналитического материалов о состоянии местного самоуправления и развития муниципальных образований в Тульской области;формирование исполнительной дирекции с необходимой и достаточной численностью сотрудников;формирование системы регулярных мероприятий (форумы, съезды, конференции и пр.) по проблематике местного самоуправления;формирование системы участия Совета муниципальных образований Тульской области в развитии гражданского общества.',
      street: 'Металлистов',
      number: '2А',
      latitude: 54.19767,
      longitude: 37.61787,
      image:
          'https://www.tulapressa.ru/wp-content/images/5947b5bf76f494.12264565.jpg',
    ),
    Institute(
      title: 'Мой семейный центр',
      description: 'ГУ ТО "Областной центр социальной помощи семье и детям"',
      type: 'НКО',
      shortDescription: 'Единый бесплатный номер - 129',
      fullDescription:
          'По поручению Губернатора Алексея Дюмина проект вошел в план действий правительства Тульской области по реализации основных направлений деятельности правительства Тульской области на период до 2026 года и является одними из приоритетных направлений программы «Люди: качество ежедневной жизни». В флагманском центре можно решить такие вопросы, как улучшение жилищных условий, взыскание алиментов, оформление мер социальной поддержки и заключение социального контракта, урегулирование семейных споров и улучшение отношений между детьми и родителями и т.д.',
      street: 'Гоголевская',
      number: '71',
      latitude: 54.181647,  //37.588458,
      longitude: 37.588458,
      image:
          'https://www.tsn24.ru/upload/medialibrary/0d2/miymdmcfapnqdfdosw8p3x9agkx4mudw.jpg',
    ),
    Institute(
      title: 'Мой семейный центр',
      description: 'ГУ ТО "Областной центр социальной помощи семье и детям"',
      type: 'НКО',
      shortDescription: 'Единый бесплатный номер - 129',
      fullDescription:
          'По поручению Губернатора Алексея Дюмина проект вошел в план действий правительства Тульской области по реализации основных направлений деятельности правительства Тульской области на период до 2026 года и является одними из приоритетных направлений программы «Люди: качество ежедневной жизни». В флагманском центре можно решить такие вопросы, как улучшение жилищных условий, взыскание алиментов, оформление мер социальной поддержки и заключение социального контракта, урегулирование семейных споров и улучшение отношений между детьми и родителями и т.д.',
      street: 'Гоголевская',
      number: '71',
      latitude: 54.181647,
      longitude: 37.588458,
      image:
          'https://www.tsn24.ru/upload/medialibrary/0d2/miymdmcfapnqdfdosw8p3x9agkx4mudw.jpg',
    ),
    Institute(
      title: 'Мой семейный центр',
      description: 'ГУ ТО "Областной центр социальной помощи семье и детям"',
      type: 'НКО',
      shortDescription: 'Единый бесплатный номер - 129',
      fullDescription:
          'По поручению Губернатора Алексея Дюмина проект вошел в план действий правительства Тульской области по реализации основных направлений деятельности правительства Тульской области на период до 2026 года и является одними из приоритетных направлений программы «Люди: качество ежедневной жизни». В флагманском центре можно решить такие вопросы, как улучшение жилищных условий, взыскание алиментов, оформление мер социальной поддержки и заключение социального контракта, урегулирование семейных споров и улучшение отношений между детьми и родителями и т.д.',
      street: 'Гоголевская',
      number: '71',
      latitude: 54.181647,
      longitude: 37.588458,
      image:
          'https://www.tsn24.ru/upload/medialibrary/0d2/miymdmcfapnqdfdosw8p3x9agkx4mudw.jpg',
    ),
    Institute(
      title: 'Мой семейный центр',
      description: 'ГУ ТО "Областной центр социальной помощи семье и детям"',
      type: 'НКО',
      shortDescription: 'Единый бесплатный номер - 129',
      fullDescription:
          'По поручению Губернатора Алексея Дюмина проект вошел в план действий правительства Тульской области по реализации основных направлений деятельности правительства Тульской области на период до 2026 года и является одними из приоритетных направлений программы «Люди: качество ежедневной жизни». В флагманском центре можно решить такие вопросы, как улучшение жилищных условий, взыскание алиментов, оформление мер социальной поддержки и заключение социального контракта, урегулирование семейных споров и улучшение отношений между детьми и родителями и т.д.',
      street: 'Гоголевская',
      number: '71',
      latitude: 54.181647,
      longitude: 37.588458,
      image:
          'https://www.tsn24.ru/upload/medialibrary/0d2/miymdmcfapnqdfdosw8p3x9agkx4mudw.jpg',
    ),
  ];
  //title&description search

  var _filteredInstitutes = <Institute>[];

  final _searchController = TextEditingController();

  void _searchInstitutes() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredInstitutes = _institutes.where((Institute institute) {
        return institute.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    if (query.isNotEmpty) {
      _filteredInstitutes = _institutes.where((Institute institute) {
        return institute.description
            .toLowerCase()
            .contains(query.toLowerCase());
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
