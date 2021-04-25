import 'package:flutter/material.dart';
import 'package:chemical/jsondata/infoscreen.dart';
import '../../../info_data.dart';


class home_tab extends StatelessWidget {
  home_tab({Key key, this.info}) : super(key: key);

  InfoData info;

  var id = ShowSearchAuto.comp;

  TextStyle textStyle = TextStyle(fontSize: 40,fontFamily: "Spotify",fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                info.record.recordTitle,
                style: textStyle,
              ),
              color: Colors.blue,
              height: 300,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              child: Text(id,
              style: textStyle,
              ),
              color: Colors.red,
              height: 300,
              width: MediaQuery.of(context).size.width,
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
