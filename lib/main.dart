import 'package:chemical/modelar.dart';
import 'package:flutter/material.dart';

import 'pages/homePage.dart';
import 'webview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      title: 'Chemical',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: webview(),
    );
  }
}
