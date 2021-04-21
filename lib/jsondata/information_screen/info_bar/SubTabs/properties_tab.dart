import 'package:flutter/material.dart';
class properties_tab extends StatelessWidget {
  const properties_tab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.blue,
              height: 300,
            ),
             Container(
              color: Colors.red,
              height: 300,
            ),
             Container(
              color: Colors.green,
              height: 300,
            ),
             Container(
              color: Colors.yellow,
              height: 300,
            ),
             Container(
              color: Colors.purple,
              height: 300,
            ),
             Container(
              color: Colors.brown,
              height: 300,
            ),
          ],
        ),
       
        
      ),
    );
  }
}