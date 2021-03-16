import 'dart:convert';

import 'package:chemical/jsondata/compoundidconvert/compound_id_services.dart';
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
      future: CompoundCIDServices().getcompoundcid("aspirine"),
      builder: (context, snapshot) {
        var mydata = snapshot.data;
        if (mydata == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  mydata,
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
