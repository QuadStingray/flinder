import 'package:flanders/state/ApplicationState.dart';
import 'package:flanders/view/map_widget.dart';
import 'package:flanders/view/user_preferences/user_preferences_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'flanders',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider<ApplicationState>(
          builder: (_) => ApplicationState(),
          child: MyHomePage(title: "Flanders"),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<ApplicationState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              gotoPreferences();
            },
          ),
          IconButton(
            icon: Icon(Icons.update),
            onPressed: () {
              appState.fetchEventData();
            },
          )
        ],
      ),
      body: MapWidget(),
    );
  }

  void gotoPreferences() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserPreferencesPage()),
    );
  }
}
