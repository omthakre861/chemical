import 'package:chemical/jsondata/shimmer/summarysubtabs/home_tab_shim.dart';
import 'package:chemical/jsondata/shimmer/summarysubtabs/property_shim.dart';
import 'package:chemical/jsondata/shimmer/summarysubtabs/safe_tab_shim.dart';
import 'package:chemical/jsondata/shimmer/summarysubtabs/struct_shim.dart';
import 'package:chemical/jsondata/shimmer/summarysubtabs/troxi_shim.dart';
import 'package:flutter/material.dart';

class summ_shim extends StatelessWidget {
  List<Widget> _infosummary = [
    Text("Summary"),
    Text("Structures"),
    Text("Properties"),
    Text("Safety"),
    Text("Toxicity")
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
          home_shim(),
          struct_shim(),
          property_shim(),
          safe_shim(),
          toxic_shim()
        ]),
      ),
    );
  }
}
