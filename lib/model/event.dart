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
}
