import 'package:flanders/model/event.dart';
import 'package:flanders/model/user.dart';
import 'package:flanders/service/Database.dart';
import 'package:flutter/foundation.dart';

class ApplicationState with ChangeNotifier {
  ApplicationState();

  var _db = DatabaseService();

  var _eventList = List<Event>();

  bool isFetchingEventData = false;
  bool isFetchingUserData = false;

  Future<void> fetchEventData() async {
    isFetchingEventData = true;
    notifyListeners();

    _db.findAllEvents().then((events) {
      _eventList.addAll(events);
      isFetchingEventData = false;
      notifyListeners();
    });

    // todo
  }

  Future<void> fetchUserData() async {
    isFetchingUserData = true;
    notifyListeners();

    // todo

    isFetchingUserData = false;
    notifyListeners();
  }

  List<User> getUserList() {
    return User.sampleUser;
  }

  List<Event> getEventList() {
    return _eventList;
  }
}
