import 'package:chemical/constrants/nav_name.dart';
import 'package:flutter/material.dart';

class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(child: Text("Hello")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, COMPOUND_DATA);
                },
                child: Text("press"))
          ],
        ),
      ),
    );
  }
}
