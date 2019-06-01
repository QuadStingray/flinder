import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:flanders/model/event.dart';

class DatabaseService {
  final Firestore _db = Firestore.instance;

  var collectionNameEvents = "events";

  /// Save Event
  Future<void> addEvent(Event event) {
    var document = _db.collection(collectionNameEvents).document();
    event.id = document.documentID;
    return document.setData(event.toJson());
  }

  /// Update Event
  Future<void> updateEvent(Event event) {
    return _db.collection(collectionNameEvents).document(event.id).setData(event.toJson());
  }

  /// Delete Event
  Future<void> deleteEvent(Event event) {
    return _db.collection(collectionNameEvents).document(event.id).delete();
  }


  Future<List<Event>> findAllEvents() async {
    var querySnapshot =  await _db.collection(collectionNameEvents).getDocuments(); //.map((list) => list.documents.map((doc) => Event.fromFirestore(doc)).toList());
    var events = querySnapshot.documents.map(
            (doc) =>
                Event.fromFirestore(doc)
    ).toList();
    return events;
  }

}
