import 'dart:convert';

import 'package:flutter/material.dart';

class jsonpract extends StatefulWidget {
  @override
  _jsonpractState createState() => _jsonpractState();
}

class _jsonpractState extends State<jsonpract> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("asset/file.json"),
      builder: (context, snapshot) {
        var mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  mydata["Record"]["RecordTitle"],
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                Text(
                  mydata["Record"]["Section"][0]["Description"],
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ],
            ),
          );
        }
      },
    ));
  }
}
