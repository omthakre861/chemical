import 'package:flutter/material.dart';


class safe_tab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
            child: Column(
              children:<Widget> [
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