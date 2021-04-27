import 'package:chemical/jsondata/infobloceq.dart';
import 'package:chemical/jsondata/information_screen/info_bar/SubTabs/home_tab.dart';
import 'package:chemical/jsondata/information_screen/info_bar/SubTabs/properties_tab.dart';
import 'package:chemical/jsondata/information_screen/info_bar/SubTabs/structure_tab.dart';
import 'package:chemical/jsondata/information_screen/info_bar/SubTabs/toxicity.dart';
import 'package:chemical/jsondata/infoscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../info_data.dart';
import '../../meltingpoint.dart';
import 'SubTabs/safety_precaution.dart';

class summary extends StatefulWidget {
  InfoData info;
  summary({this.info});
  @override
  _summaryState createState() => _summaryState(info);
}

class _summaryState extends State<summary> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _infosummary.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    print("on will pop");
    if (_tabController.index == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Info()));
    }

    Future.delayed(Duration(milliseconds: 200), () {
      print("set index");
      _tabController.index = 0;
    });

    print("return");
    return _tabController.index == 0;
  }

  List<Widget> _infosummary = [
    Text("Summary"),
    Text("Structures"),
    Text("Properties"),
    Text("Safety"),
    Text("Toxicity")
  ];

  InfoData info;

  _summaryState(this.info);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: DefaultTabController(
        length: 5,
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
                    controller: _tabController,
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
          body: TabBarView(controller: _tabController, children: [
            home_tab(
              info: info,
            ),
            structure_tab(
              info: info,
            ),
            properties_tab(
              info: info,
            ),
            safe_tab(),
            toxicity_tab(info: info)
          ]),
        ),
      ),
    );
  }
}
