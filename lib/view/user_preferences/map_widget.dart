import 'package:flanders/model/event.dart';
import 'package:flanders/state/ApplicationState.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  var state = ApplicationState();

  @override
  Widget build(BuildContext context) {
    List<Event> events = state.getEventList();
    Set<Marker> markers = Set();
    events.forEach((element) {
      markers.add(
          Marker(markerId: MarkerId(element.id), position: element.location));
    });
    return ChangeNotifierProvider<ApplicationState>(
        builder: (_) => state,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
              target:
                  events != null ? events.first.location : LatLng(0.0, 0.0)),
          markers: markers,
        ));
  }
}
