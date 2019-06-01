import 'package:flanders/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'avatar.dart';

class UserPreferencesPage extends StatefulWidget {
  UserPreferencesPage({Key key, this.user}) : super(key: key);

  final String title = "User Preferences";
  final User user;

  @override
  _UserPreferencesPageState createState() => _UserPreferencesPageState();
}

class _UserPreferencesPageState extends State<UserPreferencesPage> {
  TextEditingController nicknameController = TextEditingController();
  LatLng userLocation;
  var location = new Location();

  @override
  void initState() {
    super.initState();
    initLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: <Widget>[
            Avatar(),
            TextField(
              controller: nicknameController,
              decoration: InputDecoration(labelText: 'Nickname'),
            ),
            userLocation == null
                ? CircularProgressIndicator()
                : Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: userLocation,
                        zoom: 20.0,
                      ),
                      myLocationEnabled: true,
                    ))
          ],
        ));
  }

  void initLocation() async {
    var map = await location.getLocation();
    setState(() {
      userLocation = LatLng(map['latitude'], map['longitude']);
    });
    if (widget.user != null) {
      this.nicknameController.text = widget.user.nickname;
      this.nicknameController.addListener(() {
        widget.user.nickname = this.nicknameController.text;
      });
    }
  }
}
