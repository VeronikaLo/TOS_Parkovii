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
  final _institutes = [
    //исправить
    Institute(
      iD: '20',
      title: 'Ассоциация «СМО Тульской области»',
      description: 'Объединение местных самоуправлений',
      type: 'НКО',
      shortDescription: '+7(487)255-46-50',
      fullDescription:
          'Ассоциация «Совет муниципальных образований Тульской области» является объединением муниципальных образований Тульской области в целях обеспечения защиты прав муниципальных образований, являющихся членами Совета, и представления их общих интересов, а также обеспечения координации деятельности членов Совета по развитию правовой, организационной, финансово-экономической и территориальной основ местного самоуправления в Тульской области.Главная задача Совета — содействие развитию местного самоуправления на территории Тульской области.Приоритетные направления деятельности Совета:участие в законодательном и нормативном регулировании муниципальной деятельности в Тульской области;правовое консультирование и правовая защита интересов муниципальных образований, руководителей органов местного самоуправления;изучение и распространение лучших практик муниципального управления;организация предоставления методической помощи муниципальным образованиям;участие в организации системы подготовки и переподготовки;организация конкурсной деятельности на звание лучшего муниципального образования, лучшего главы, лучшего муниципального служащего;предоставление аналитического материалов о состоянии местного самоуправления и развития муниципальных образований в Тульской области;формирование исполнительной дирекции с необходимой и достаточной численностью сотрудников;формирование системы регулярных мероприятий (форумы, съезды, конференции и пр.) по проблематике местного самоуправления;формирование системы участия Совета муниципальных образований Тульской области в развитии гражданского общества.',
      street: 'Металлистов',
      number: '2А',
      latitude: 37.61787,
      longitude: 54.19767,
      image:
          'https://www.tulapressa.ru/wp-content/images/5947b5bf76f494.12264565.jpg',
    ),
    Institute(
      iD: '21',
      title: 'Мой семейный центр',
      description: 'ГУ ТО "Областной центр социальной помощи семье и детям"',
      type: 'НКО',
      shortDescription: 'Единый бесплатный номер - 129',
      fullDescription:
          'По поручению Губернатора Алексея Дюмина проект вошел в план действий правительства Тульской области по реализации основных направлений деятельности правительства Тульской области на период до 2026 года и является одними из приоритетных направлений программы «Люди: качество ежедневной жизни». В флагманском центре можно решить такие вопросы, как улучшение жилищных условий, взыскание алиментов, оформление мер социальной поддержки и заключение социального контракта, урегулирование семейных споров и улучшение отношений между детьми и родителями и т.д.',
      street: 'Гоголевская',
      number: '71',
      latitude: 37.588458,
      longitude: 54.181647,
      image:
          'https://www.tsn24.ru/upload/medialibrary/0d2/miymdmcfapnqdfdosw8p3x9agkx4mudw.jpg',
    ),
    Institute(
        iD: '22',
        title: '"Хасдэй Нэшама"',
        description: 'Ежедневно с 10-00 до 20-00, экскурсии - по записи',
        type: 'НКО',
        shortDescription: '+7(4872) 36-92-35.',
        fullDescription:
            'Тульский областной еврейский благотворительный Центр. Тульский областной еврейский благотворительный центр «Хасдей Нешама» («Милосердие») был зарегистрирован 26 апреля 1996 г. Его возглавила Фаина Саневич, еще в 1994 г. организовавшая помощь самым нуждавшимся пожилым евреям. Городские власти предоставили благотворительной организации в бесплатное пользование часть детского сада при условии ремонта всего здания. Условие было выполнено — помогли благотворители. Сегодня в Тульском областном еврейском благотворительном центре «Хасдэй Нэшама» реализуются более 50 программ. В их числе – медицинская программа, включающая консультации врачей, зубопротезирование, льготную выдачу лекарств, прокат медицинского оборудования и экстренную помощь, и социальная программа ухода на дому с выдачей продуктовых наборов. Функционирует Дневной центр пребывания пожилых людей с множеством лекториев и клубов по интересам. Работает библиотека. На праздниках и мероприятиях выступает инструментальный ансамбль. ',
        street: 'Свободы',
        number: '41',
        latitude: 54.185625,
        longitude: 37.602741,
        image:
            'https://avatars.mds.yandex.net/get-altay/374295/2a0000015b15aaeb9df52e1ceca8cd8f549b/XXXL'),
    Institute(
      iD: '23',
      title: 'Музей «Гармони Деда Филимона»',
      description: 'Пн-вс с 10-00 до 18-00',
      type: 'КО',
      shortDescription: ' +7 (910) 157-17-19',
      fullDescription:
          'В музее вы узнаете о происхождении и развитии гармони, о том как совершенствовался промысел от миниатюрных гармошик-черепашек XIX века, которые пользовались популярностью среди эстрадных гармонистов и цирковых музыкантов, до огромных концертных баянов и аккордионов. Коллекция музея насчитывает более 100 экспонатов. Каждая музейная гармонь уникальна в своем роде, неповторима, особенна. За каждой стоит своя история: рядом с ровесницами века - пятирядной псковской резухой, саратовской и вологодской гармониками с колокольчиками, соседствует гармонь, собранная безпризорниками на фабрике Деткомиссии в Туле, тут же - боевая подруга, прошедшая со своим владельцем тяжелые годы войны, и послевоенный итальянский аккордеон с двумя рояльными клавиатурами. Вы будете приятно удивлены и современными инструментами, изготовленными на одном из старейших предприятий России - фабрики "Тульская гармонь". Решение о создании музея, посвященного истории развития гармонного производства, было принято в апреле 2015 года. В течение двух лет проводилась исследовательская работа, формировалась экспозиция, собиралась коллекция инструментов. Музей открыт в январе 2018 г. в культурно-историческом центре Тулы, в старинном здании XIX века, в шаговой доступности от Тульского кремля. В названии музея используется имя мифического персонажа деда Филимона. Это собирательный образ талантливого русского мастера, умеющего и игрушку слепить, и гармонь сделать.',
      street: 'Менделеевская',
      number: '9',
      latitude: 54.192458,
      longitude: 37.621776,
      image:
          'http://www.harmonic-museum.ru/local/templates/platform/assets/images/museum.jpg',
    ),
    Institute(
      iD: '24',
      title: 'Музей "Филимоновская игрушка"',
      description: 'Ср-вс с 10-00 до 17-00, пн-вт - выходные',
      type: 'КО',
      shortDescription: '+7 (910) 151-07-70',
      fullDescription:
          'Музей "Филимоновская игрушка", открытый в октябре 2009 года, - единственный специализированный музей, посвященный одноименной игрушке, и первый за более чем 600-летнюю историю промысла.Основу экспозиции составляют работы старых прославленных мастериц А.Г. Зайцевой, А.Г. Карповой, А.И. Дербенёвой, Е.И. Лукьяновой и Е.К. Евдокимовой, а также современных мастеров - В.Н. Масленниковой, Е.А. Орловой, В.Б. Першина, Р.В. Орлова, К.Н. и Е.И. Кехаиди и их сына Платона, М.Н. Марченковой, А.И. Гончаровой и ее дочери Анны, Г.В. Мишиной, И.Д. Бежиной, Е.М. Палевской. В музее представлены редкие уникальные фото и архивные материалы о жизни и творчестве прежних и нынешних мастеров. Ну и конечно в музее можно увидеть процесс создания игрушки, а при желании и самому попробовать свои силы. Возьмите в руки комок мягкой синей глины и вы ощутите ее энергию. Прислушайтесь к ее внутреннему голосу и вдохните в нее жизнь, создав коня, уточку или петуха',
      street: 'пгт Одоев, Карла Маркса',
      number: '52',
      latitude: 53.936206,
      longitude: 36.687547,
      image:
          'https://visittula.com/upload/resize_cache/iblock/f86/700_600_2/f8661034bc7bee767d914ba443b4e261.jpg',
    ),
    Institute(
      iD: '25',
      title: 'Тульское музейное объединение',
      description:
          'Государственного учреждения культуры Тульской области (ГУК ТО)',
      type: 'ГОС',
      shortDescription: '+7 (4872) 36-22-08',
      fullDescription:
          'У нас хранится более 200 000 экспонатов.Посетив наши музеи, вы лучше будете знать историю тульского края, познакомитесь с уникальными экспонатами изобразительного и декоративно-прикладного искусства.Рекомендуем заранее записываться на экскурсии. В день визита уточняйте график работы музея.В состав входит 19 музеев, которые находятся на территории Тулы и Тульской области',
      street: 'Советская',
      number: '68',
      latitude: 54.191047668,
      longitude: 37.618415833,
      image:
          'https://sun9-60.userapi.com/s/v1/if1/pKWUdC56JjFbQ…-uB0cEKlGw.jpg?size=650x615&quality=96&type=album',
    ),
    Institute(
      iD: '26',
      title: 'Музей истории евреев Тулы',
      description: 'Ежедневно с 10-00 до 20-00, экскурсии - по записи',
      type: 'НКО',
      shortDescription: '+7(910)-943-20-77',
      fullDescription:
          'Функционирует на базе тульского областного еврейского благотворительного центра "Хасдэй Нэшама" и рассказывает о жизни евреев, начиная с 1840г. Обширная коллекция предметов быта, культа и пр. Есть раздел музея, посвященный евреям-тулякам, участвовавшим в Великой Отечественной войне. Гости могут посмотреть картины А.М. Майорова, посвященные Холокосту. Возможен осмотр старинного еврейского кладбища. Возможны различные типы экскурсий: детские, взрослые, с освещенеим религиозных, краеведческих, исторических тем. Экскурскии могут проводиться на английском и иврите.',
      street: 'Свободы',
      number: '41',
      latitude: 54.185625,
      longitude: 37.602741,
      image:
          'http://rusonom.ru/media/cache/f9/0c/f90c6499681cac9924889b559d3de99b.jpg',
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
