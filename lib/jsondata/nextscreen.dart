import 'package:flutter/material.dart';

import 'meltingpoint.dart';

class nextscreen extends StatelessWidget {
  nextscreen({Key key, this.information, this.compound}) : super(key: key);
  Info information;
  var compound;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(information.record.recordTitle),
        ),
      )
    );
  }
}
