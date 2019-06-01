import 'package:flanders/model/event.dart';
import 'package:flanders/state/ApplicationState.dart';
import 'package:flanders/view/event_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<ApplicationState>(context);
    List<Event> events = appState.getEventList();
    Set<Marker> markers = Set();
    events.forEach((element) {
      markers.add(Marker(
          markerId: MarkerId(element.id),
          position: element.location,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EventDetailScreen(element)));
          }));
    });

    return Container(
        child: appState.isFetchingEventData
            ? CircularProgressIndicator()
            : appState.getEventList() != null
            ? GoogleMap(
          initialCameraPosition: CameraPosition(
              zoom: 10.0,
              target: events.isNotEmpty
                  ? events.first.location
                  : LatLng(0.0, 0.0)),
          markers: markers,
        )
            : Text("Press Button above to fetch data"));
  }
}
