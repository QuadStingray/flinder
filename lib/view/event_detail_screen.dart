import 'package:flanders/model/event.dart';
import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;

  const EventDetailScreen(this.event, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(event.description),
            SizedBox(
              height: 16.0,
            ),
            Text("${event.startTime.toLocal()}"),
            Text("${event.endTime.toLocal()}"),
            SizedBox(
              height: 16.0,
            ),
            Text(event.externalUrl),
          ],
        ),
      ),
    );
  }
}
