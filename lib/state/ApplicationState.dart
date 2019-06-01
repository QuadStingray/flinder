import 'package:flanders/model/event.dart';
import 'package:flanders/model/user.dart';
import 'package:flutter/foundation.dart';

class ApplicationState with ChangeNotifier {
  ApplicationState();

  bool _isFetchingEventData = false;
  bool _isFetchingUserData = false;

  Future<void> fetchEventData() async {
    _isFetchingEventData = true;
    notifyListeners();

    // todo

    _isFetchingEventData = false;
    notifyListeners();
  }

  Future<void> fetchUserData() async {
    _isFetchingUserData = true;
    notifyListeners();

    // todo

    _isFetchingUserData = false;
    notifyListeners();
  }

  List<User> getUserList() {}

  List<Event> getEventList() {}
}
