// мероприятия
class Event {
  final String title;
  final String place;
  final String time;
  final String date;
  final String description;
  final String type;
  final dynamic longitude;
  final dynamic latitude;
  final String picture;

  Event(
      {required this.title,
      required this.place,
      required this.description,
      required this.time,
      required this.date,
      required this.type,
      required this.longitude,
      required this.latitude,
      required this.picture});
}

// организации
class Institute {
  final String iD;
  final String title;
  final String description;
  final String type;
  final String shortDescription;
  final String fullDescription;
  final String street;
  final String number;
  final dynamic latitude;
  final dynamic longitude;
  final String image;

  Institute(
      {required this.iD,
      required this.title,
      required this.description,
      required this.type,
      required this.shortDescription,
      required this.fullDescription,
      required this.street,
      required this.number,
      required this.latitude,
      required this.longitude,
      required this.image});
}
// пространства

class Area {
  final String iD;
  final String title;
  final String description;
  final String type;
  final String condition;
  final String financing;
  final String fullDescription;
  final String street;
  final String number;
  final dynamic latitude;
  final dynamic longitude;
  final String image;

  Area(
      {required this.iD,
      required this.title,
      required this.description,
      required this.type,
      required this.condition,
      required this.financing,
      required this.fullDescription,
      required this.street,
      required this.number,
      required this.latitude,
      required this.longitude,
      required this.image});
}

// дома
class House {
  final String iD;
  final String street;
  final String number;
  final String nameSenior;
  final String surnameSenior;
  final String patronymicSenior;
  final String shortNameSenior;
  final String phoneNumber;
  final String photoSenior;
  final String company;
  final String construction;
  final dynamic latitude;
  final dynamic longitude;

  House({
    required this.iD,
    required this.street,
    required this.number,
    required this.nameSenior,
    required this.surnameSenior,
    required this.patronymicSenior,
    required this.shortNameSenior,
    required this.phoneNumber,
    required this.photoSenior,
    required this.company,
    required this.construction,
    required this.latitude,
    required this.longitude,
  });
}
