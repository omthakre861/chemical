import 'package:chemical/webview.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';
import 'jsondata/jsonParse.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',
      theme: ThemeData(
        primaryColor: Colors.blue[400],
      ),
      home: jsonParse(),
    );
  }
}
