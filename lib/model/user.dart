import 'package:latlong/latlong.dart';

class User {
  final String id;
  String nickname;
  String email;
  LatLng location;
  String avatarId;
  String _token;

  set token(String value) {
    _token = value;
  }

  User({this.id, this.nickname, this.email, this.location, this.avatarId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        nickname: json['nickname'],
        email: json['email'],
        location: json["location"],
        avatarId: json['avatarId']);
  }

  Map toJson() {
    return {
      'id': id,
      'nickname': nickname,
      'email': email,
      'location': location,
      'avatarId': avatarId
    };
  }
}
