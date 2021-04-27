import 'package:chemical/jsondata/information_screen/info_bar/summary.dart';
import 'package:chemical/jsondata/information_screen/model_bar/model.dart';
import 'package:chemical/jsondata/meltingpoint.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../info_data.dart';

class comp_info extends StatefulWidget {
  InfoData info;
  comp_info({this.info});
  @override
  _comp_infoState createState() => _comp_infoState(info);
}

class _comp_infoState extends State<comp_info> {

  InfoData info;
  
  List<Widget> _infoTabs = <Widget>[Text("Content"), Text("Model")];

  _comp_infoState(this.info);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade900,
          bottom: PreferredSize(
            preferredSize: Size.zero,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.25,

                // color: Colors.black,
                child: TabBar(
                  indicatorColor: Colors.transparent,
                  labelPadding: EdgeInsets.only(left: 10),
                  labelStyle: TextStyle(
                    fontFamily: "Spotify",
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                  ),
                  tabs: _infoTabs,
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(children: <Widget>[
          summary(info: info,),
          model(),
        ]),
      ),
    );
  }
}
