import 'package:flutter/material.dart';
import 'package:tos_parkovii/helper.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final _events = [
    Event(
      title: 'Фестиваль "Сила в Правде"',
      place: 'Центр. парк культуры и отдыха им. Белоусова',
      description: 'Обязательно приходите, вас ждет разнообразная программа для всех возрастов. Каждый найдет себе занятие по душе. Вместе мы - сила!',
      time: '19:00',
      date: '18 марта 2022',
      type: 'культура',
      longitude: 37.588458,
      latitude: 54.181647,
      picture:'https://sun9-65.userapi.com/s/v1/if2/SLqSHXtuax11NFtVh3MOvG1ZWeb_PWQIAs0FStYe2G5rIZl8GHiOgqoA-1ym7Fu7aKb9dG_-KyVZxHJa16vyo_tH.jpg?size=905x1280&quality=95&type=album',
    ),
    Event(
      title: 'Экомобиль Тульская область',
      place: 'ул.Л.Толстого 93',
      description: 'Вчера Экомобиль принимал вторсырьё на ул. ул.Металлургов, 62а (парковка ТЦ "Демидовский"). Вопреки обыкновению пришло лишь восемь человек. Тем не менее, среди них были люди, сдававшие вторсырьё огромными мешками, а также те, кто навещает нас каждый месяц. Благодарим всех пришедших и призываем других начинать жить осознанно! Следующий раз ждём всех желающих по адресу ул. Льва Толстого, д. 93 с 18:00 до 19:30.',
      time: '18:00 - 19:30 ',
      date: '22 мая 2022',
      type: 'экология',
      longitude: 37.602687,
      latitude: 54.184856,
      picture:'https://sun9-9.userapi.com/s/v1/if2/xS2zd-WG4I0lDHmU4EcI9oPh1cz0l_TZ2B8E2w1W4-9uIfICSgHiSmsxbVisz1i6mwuHYtNhmy-vHei-TepHNKvU.jpg?size=1080x675&quality=96&type=album',
    ),
    Event(
      title: 'Готовимся к Пасхе',
      place: 'Центр. парк культуры и отдыха им. Белоусова',
      description: 'Посмотрите, с каким удовольствием наши юные посетители Центрального парка погрузились в процесс украшение пасхальных яиц. Мастер-класс от Тульской птицефабрики будет проходить в этом году на главной эстраде ЦПКиО. Время проведения с 12.00 до 16.00. Не пропустите! Ваши дети точно скажут вам спасибо.',
      time: '12:00 - 16:00',
      date: '17 апреля 2022',
      type: 'семейное добрососедство',
      longitude: 37.588458,
      latitude: 54.181647,
      picture:'https://sun9-6.userapi.com/s/v1/if2/hS_5W9Bd6bqJMjARyJq9BACfK3etWpqSbAwaG7o6W8ifPRpL0U50WENyX2V67XOkHhZCa3RtNsHtqFE9FsJkjaM3.jpg?size=1280x960&quality=96&type=album',
    ),
    Event(
      title: 'Открытие "Моего семейного центра"',
      place: 'ул. Гоголевская д.71',
      description: 'В центре можно решить такие вопросы, как улучшение жилищных условий, взыскание алиментов, оформление мер соц. поддержки и заключение социального контракта, урегулирование семейных споров и улучшение отношений между детьми и родителями и т.д. Новое отделение работает в режиме семейного многофункционального центра. Граждане могут обратиться за помощью как в «Семейную диспетчерскую» по единому бесплатному номеру 129, так и лично. Здесь созданы все условия для мам с колясками и игровая зона для детей. Семья получает комплексную социальную помощь на основе «бесшовного» взаимодействия, и с момента обращения до решения вопроса семью сопровождает один и тот же специалист.',
      time: '14:00',
      date: '1 февраля 2022',
      type: 'образование',
      longitude: 37.588458,
      latitude: 54.181647,
      picture:'https://sun9-86.userapi.com/s/v1/if2/dHoT4asCc1n432NCTnhHgf3ygwZcTsxsmRtvic7J46cpQLGDKKS1xxmaj9jgqhg2RmFuEWCmMJq5ioxm5h87AQ_s.jpg?size=1800x1200&quality=96&type=album',
    ),
    Event(
      title: 'Mероприятиe 1',
      place: '',
      description: 'Description проведения мероприятия',
      time: '',
      date: '12 октября 2021',
      type: '',
      longitude: 37.588458,
      latitude: 54.181647,
      picture:'',
    ),
    Event(
      title: 'Mероприятиe 2',
      place: '',
      description: 'Description проведения мероприятия',
      time: '25 мая',
      date: '25 мая',
      type: '',
      longitude: 37.588458,
      latitude: 54.181647,
      picture:'',
    ),
    Event(
      title: 'Mероприятиe 3',
      place: '',
      description: 'Description проведения мероприятия',
      time: '25 мая',
      date: '25 мая 2022',
      type: '',
      longitude: 37.588458,
      latitude: 54.181647,
      picture:'',
    ),
    
  ];
  //title&description search
  var _filteredEvents = <Event>[];

  final _searchController = TextEditingController();

  void _searchEvents() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredEvents = _events.where((Event event) {
        return event.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    if (query.isNotEmpty) {
      _filteredEvents = _events.where((Event event) {
        return event.description.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredEvents = _events;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredEvents = _events;
    _searchController.addListener(_searchEvents);
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
        backgroundColor: const Color.fromRGBO(241, 136, 37, 1),
        title: const Text('Мероприятия',
            style: TextStyle(
                fontSize: 24, fontFamily: "Lato", color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
          width: 395,
          height: 700,
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
                  itemCount: _filteredEvents.length,
                  itemBuilder: (BuildContext context, int index) {
                    final event = _filteredEvents[index];
                    return GestureDetector(
                        //pressing with no response
                        onTap: () {
                          Navigator.of(context).pushNamed('/e_details', arguments: _events[index] );
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
                                                    241, 136, 37, 0.7)),
                                            padding: const EdgeInsets.all(3),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(event.date,
                                                  textAlign: TextAlign.center,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "Lato",
                                                      color: Colors.white)),
                                            ),
                                          )
                                        ]),
                                        title: Text(event.title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontFamily: "Lato",
                                                color: Color.fromRGBO(
                                                    35, 33, 34, 1))),
                                        subtitle: Text(event.place,
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
                                            
                                            Navigator.of(context)
                                                .pushNamed('/e_details', arguments: _events[index] );
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
