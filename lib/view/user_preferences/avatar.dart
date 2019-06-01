import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Container(
        child: new Stack(
          children: <Widget>[
            FractionalTranslation(
              translation: Offset(0.0, 0.0),
              child: Align(
                child: CircleAvatar(
                  radius: 50.0,
                  child: Text("A"),
                ),
                alignment: FractionalOffset(0.0, 0.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
