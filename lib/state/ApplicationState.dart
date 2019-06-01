import 'package:flanders/model/event.dart';
import 'package:flanders/model/user.dart';
import 'package:flanders/service/Database.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApplicationState with ChangeNotifier {
  ApplicationState();

  var _db = DatabaseService();

  var _eventList = List<Event>();

  bool _isFetchingEventData = false;
  bool _isFetchingUserData = false;

  Future<void> fetchEventData() async {
    _isFetchingEventData = true;
    notifyListeners();

    _db.findAllEvents().then((events) => {_eventList.addAll(events)});

    // todo
    _isFetchingUserData = false;
    notifyListeners();
  }

  Future<void> fetchUserData() async {
    _isFetchingUserData = true;
    notifyListeners();

    // todo

    _isFetchingUserData = false;
    notifyListeners();
  }

  List<User> getUserList() {
    return User.sampleUser;
  }

  List<Event> getEventList() {
    return _eventList;
  }
}
