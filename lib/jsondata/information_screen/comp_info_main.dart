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

class _comp_infoState extends State<comp_info>
    with SingleTickerProviderStateMixin {
  InfoData info;
  TabController _tabController;

  List<Widget> _infoTabs = <Widget>[
    FittedBox(fit: BoxFit.fitWidth, child: Text("Content")),
    FittedBox(fit: BoxFit.fitWidth, child: Text("Model"))
  ];

  _comp_infoState(this.info);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _infoTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    print("on will pop");
    // if (_tabController.index == 0) {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => Info()));
    // }

    Future.delayed(Duration(milliseconds: 200), () {
      print("set index");
      _tabController.index = 0;
    });

    print("return");
    return _tabController.index == 0;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: DefaultTabController(
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
                    child: TabBar(
                      controller: _tabController,
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
            body: PageView(
              children: [
                TabBarView(
                    controller: _tabController,
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
      ),
    );
  }
}
