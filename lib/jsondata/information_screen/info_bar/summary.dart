import 'package:chemical/jsondata/information_screen/info_bar/SubTabs/home_tab.dart';
import 'package:chemical/jsondata/information_screen/info_bar/SubTabs/properties_tab.dart';
import 'package:chemical/jsondata/information_screen/info_bar/SubTabs/structure_tab.dart';
import 'package:flutter/material.dart';

import '../../info_data.dart';
import '../../meltingpoint.dart';

class summary extends StatefulWidget {
  InfoData info;
  summary({this.info});
  @override
  _summaryState createState() => _summaryState(info);
}

class _summaryState extends State<summary> {
  List<Widget> _infosummary = [
    Text("Summary"),
    Text("Structures"),
    Text("Properties"),
    // Text("Safety"),
  ];

  InfoData info;

  _summaryState(this.info);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade900,
          bottom: PreferredSize(
            preferredSize: Size.zero,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: MediaQuery.of(context).size.width,

                // color: Colors.black,
                child: TabBar(
                  isScrollable: true,
                  indicatorWeight: 3,
                  indicatorColor: Colors.blue,
                  indicatorSize: TabBarIndicatorSize.label,
                  // labelPadding: EdgeInsets.only(right: 5),
                  labelStyle: TextStyle(
                    fontFamily: "Spotify",
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: _infosummary,
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(children: [
          home_tab(
            info: info,
          ),
          structure_tab(info: info,),
          properties_tab(info: info,)
        ]),
      ),
    );
  }
}
