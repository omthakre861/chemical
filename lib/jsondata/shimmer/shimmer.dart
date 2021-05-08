import 'package:chemical/jsondata/shimmer/shim_summary.dart';
import 'package:chemical/jsondata/shimmer/model_shim.dart';
import 'package:flutter/material.dart';

class tab_shim extends StatelessWidget {
  List<Widget> _infoTabs = <Widget>[
    FittedBox(fit: BoxFit.fitWidth, child: Text("Content")),
    FittedBox(fit: BoxFit.fitWidth, child: Text("Model"))
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade900,
          appBar: AppBar(
            automaticallyImplyLeading: false,
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
          body: PageView(children: [
            TabBarView(children: <Widget>[summ_shim(), model_shim()])
          ]),
        ),
      ),
    );
  }
}
