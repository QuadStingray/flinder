import 'package:latlong/latlong.dart';

class Event {
  final String id;
  String title;
  LatLng location;
  DateTime startTime;
  DateTime endTime;
  String description;
  List<String> tags;

  Event(
      {this.id,
      this.title,
      this.location,
      this.startTime,
      this.endTime,
      this.description,
      this.tags});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        id: json['id'],
        title: json['title'],
        location: json['location'],
        startTime: json['startTime'],
        endTime: json['endTime'],
        description: json['description'],
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
      'tags': tags
    };
  }
}
