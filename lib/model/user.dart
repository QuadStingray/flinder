import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nickname': nickname,
      'email': email,
      'location': location,
      'avatarId': avatarId
    };
  }

  static List<User> sampleUser = [
    User(
        id: "_userId_1234567",
        nickname: "User Number 1",
        email: "user@mee.com",
        location: LatLng(49.7975, 49.7975),
        avatarId: "CowboyCoder.flr"),
    User(
        id: "_userId_987654321",
        nickname: "User Number 2",
        email: "user2@mee.com",
        location: LatLng(49.7975, 49.7975),
        avatarId: "Sourcerer.flr")
  ];
}
