import 'package:chemical/jsondata/information_screen/info_bar/SubTabs/home_tab.dart';
import 'package:chemical/jsondata/information_screen/info_bar/SubTabs/properties_tab.dart';
import 'package:chemical/jsondata/information_screen/info_bar/SubTabs/structure_tab.dart';
import 'package:flutter/material.dart';

class summary extends StatefulWidget {
  @override
  _summaryState createState() => _summaryState();
}

class _summaryState extends State<summary> {
  List<Widget> _infosummary = [
    Text("Summary"),
    Text("Structures"),
    Text("Properties"),
    Text("Safety"),
    
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey.shade800,
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
        body: TabBarView(children: 
        [
          home_tab(),
          structure_tab(),
          properties_tab()
        ]),
      ),
    );
  }
}
