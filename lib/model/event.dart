import 'package:latlong/latlong.dart';

class Event {
  final String id;
  String title;
  LatLng location;
  DateTime startTime;
  DateTime endTime;
  String description;
  String source;
  String externalId;
  List<String> tags;

  Event(
      {this.id,
      this.title,
      this.location,
      this.startTime,
      this.endTime,
      this.description,
      this.source,
      this.externalId,
      this.tags});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        id: json['id'],
        title: json['title'],
        location: json['location'],
        startTime: json['startTime'],
        endTime: json['endTime'],
        description: json['description'],
        source: json['source'],
        externalId: json['externalId'],
        tags: json['tags']);
  }

  Map toJson() {
    return {
      'id': id,
      'title': title,
      'location': location,
      'startTime': startTime,
      'endTime': endTime,
      'description': description,
      'source': source,
      'externalId': externalId,
      'tags': tags
    };
  }

  static List<Event> sampleEvents = [
    Event(
        id: "1234",
        title: "Awesome Flutter",
        location: LatLng(49.78951644897461, 9.980087280273438),
        startTime: DateTime.parse("2019-07-23 18:00:00Z"),
        endTime: DateTime.parse("2019-07-23 23:00:00Z"),
        description:
            "Awesome Flutter in Würzburg",
        source: "meetup",
        externalId: "261446017",
        tags: ["google", "flutter"]),
    Event(
        id: "45678",
        title: "Flutter by Example",
        location: LatLng(49.7975959777832, 9.928215026855469),
        startTime: DateTime.parse("2019-08-21 19:00:00Z"),
        endTime: DateTime.parse("2019-08-21 22:00:00Z"),
        description:
        "Flutter Samples explained.",
        source: "meetup",
        externalId: "25243523",
        tags: ["flutter", "coding"])
  ];
}
