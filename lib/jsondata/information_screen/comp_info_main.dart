import 'package:chemical/jsondata/information_screen/info_bar/summary.dart';

import 'package:flutter/material.dart';

import '../info_data.dart';
import 'model_bar/3dview/3dView.dart';

class comp_info extends StatefulWidget {
  InfoData info;
  comp_info({this.info});
  @override
  _comp_infoState createState() => _comp_infoState(info);
}

class _comp_infoState extends State<comp_info> {
  InfoData info;

  List<Widget> _infoTabs = <Widget>[
    FittedBox(fit: BoxFit.fitWidth, child: Text("Content")),
    FittedBox(fit: BoxFit.fitWidth, child: Text("Model"))
  ];

  _comp_infoState(this.info);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade900,
          appBar: AppBar(
            // status bar color
            brightness: Brightness.dark,
            elevation: 0,
            backgroundColor: Colors.grey.shade900,
            flexibleSpace: PreferredSize(
              preferredSize: Size.zero,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.25,

                  // color: Colors.black,
                  child: Expanded(
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
          ),
          body: PageView(
            children: [
              TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    summary(
                      info: info,
                    ),
                    webview(),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
