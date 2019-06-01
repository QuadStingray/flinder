import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        title: 'flanders',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MapWidget());
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
          )
        ],
      ),
      body: Center(),
    );
  }

  void gotoPreferences() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserPreferencesPage()),
    );
  }
}
