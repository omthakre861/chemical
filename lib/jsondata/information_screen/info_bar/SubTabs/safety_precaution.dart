import 'package:chemical/jsondata/info_data.dart';
import 'package:flutter/material.dart';

class safe_tab extends StatefulWidget {
  safe_tab({Key key, this.info}) : super(key: key);

  InfoData info;
  @override
  _safe_tabState createState() => _safe_tabState();
}

class _safe_tabState extends State<safe_tab> {
  int safe_id;
  int first_id;
  int prevent_id;
  int health_id;
  int fire_id;
  int skin_id;
  int ghs_id;

  @override
  void initState() {
    super.initState();
    safe_id = index();
    // print("safe");
    // print(safe_id);
    if (safe_id != -1) {
      ghs_id = ghs_info();
      // print("ghs");
      // print(ghs_id);
      prevent_id = prev_index();
      // print("preve");
      // print(prevent_id);
      first_id = first_index();
      // print("first");
      // print(first_id);
      health_id = health_index();
      // print("health");
      // print(health_id);
      fire_id = fire_index();
      // print("fire");
      // print(fire_id);
      skin_id = skin_index();
    }
  }

  List<String> first_aid = [
    "Inhalation First Aid",
    "Skin First Aid",
    "Eye First Aid",
    "Ingestion First Aid"
  ];

  List<String> prevention = [
    "Fire Prevention",
    "Exposure Prevention",
    "Inhalation Prevention",
    "Skin Prevention",
    "Eye Prevention",
    "Ingestion Prevention"
  ];

  Widget safety() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.info.record.section[safe_id].section[0].section[0]
          .information[ghs_id].value.stringWithMarkup
          .map(
            (sf) => Column(
              children: [
                if (sf.string.contains("):")) ...[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(5),
                    child: Text(
                      (() {
                        int start = sf.string.indexOf("(");
                        int end = sf.string.indexOf(")");
                        if (start != -1) {
                          return sf.string.split(":")[1].trim() +
                              " " +
                              sf.string.substring(start, end + 1);
                        } else {
                          return sf.string.split(":")[1].trim();
                        }
                      }()),
                      style: TextStyle(
                          fontFamily: "Spotify",
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffbbb2e9)),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.red,
                  ),
                ] else ...[
                  Container(),
                ]
              ],
            ),
          )
          .toList(),
    );
  }

  Widget firstaid() {
    return Column(
      children: widget.info.record.section[safe_id].section[first_id].section
          .map((fa) {
        if (first_aid.contains(fa.tocHeading)) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  fa.tocHeading,
                  style: TextStyle(
                      fontFamily: "Spotify",
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffbbb2e9)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  fa.information[0].value.stringWithMarkup[0].string,
                  style: TextStyle(
                      fontFamily: "Spotify",
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.red,
              )
            ],
          );
        } else {
          return SizedBox();
        }
      }).toList(),
    );
  }

  Widget prevent() {
    return Column(
      children: widget.info.record.section[safe_id].section[prevent_id].section
          .map((fa) {
        if (prevention.contains(fa.tocHeading)) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  fa.tocHeading,
                  style: TextStyle(
                      fontFamily: "Spotify",
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffbbb2e9)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  fa.information[0].value.stringWithMarkup[0].string,
                  style: TextStyle(
                      fontFamily: "Spotify",
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.red,
              )
            ],
          );
        } else {
          return SizedBox();
        }
      }).toList(),
    );
  }

  Widget health() {
    return Container(
      margin: EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Health Hazards",
            style: TextStyle(
                fontFamily: "Spotify",
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Color(0xffbbb2e9)),
          ),
          Text(
            widget.info.record.section[safe_id].section[0].section[health_id]
                .information[0].value.stringWithMarkup[0].string,
            style: TextStyle(
                fontFamily: "Spotify",
                fontSize: 19,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget fire() {
    return Container(
      margin: EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Fire Hazards",
            style: TextStyle(
                fontFamily: "Spotify",
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Color(0xffbbb2e9)),
          ),
          Text(
            widget.info.record.section[safe_id].section[0].section[fire_id]
                .information[0].value.stringWithMarkup[0].string,
            style: TextStyle(
                fontFamily: "Spotify",
                fontSize: 19,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget skin() {
    return Container(
      margin: EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Skin, Eye, and Respiratory Irritations",
            style: TextStyle(
                fontFamily: "Spotify",
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Color(0xffbbb2e9)),
          ),
          Text(
            widget.info.record.section[safe_id].section[0].section[skin_id]
                .information[0].value.stringWithMarkup[0].string,
            style: TextStyle(
                fontFamily: "Spotify",
                fontSize: 19,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ],
      ),
    );
  }

  int index() {
    int index = -1;

    for (int i = 0; i < widget.info.record.section.length; i++) {
      if (widget.info.record.section[i].tocHeading == "Safety and Hazards") {
        return index = i;
      }
    }
    return index;
  }

  int ghs_info() {
    int index = -1;

    for (int i = 0;
        i <
            widget.info.record.section[safe_id].section[0].section[0]
                .information.length;
        i++) {
      if (widget.info.record.section[safe_id].section[0].section[0]
              .information[i].name ==
          "GHS Hazard Statements") {
        return index = i;
      }
    }
    return index;
  }

  int first_index() {
    int index = -1;

    for (int i = 0;
        i < widget.info.record.section[safe_id].section.length;
        i++) {
      if (widget.info.record.section[safe_id].section[i].tocHeading ==
          "First Aid Measures") {
        return index = i;
      }
    }
    return index;
  }

  int prev_index() {
    int index = -1;

    for (int i = 0;
        i < widget.info.record.section[safe_id].section.length;
        i++) {
      if (widget.info.record.section[safe_id].section[i].tocHeading ==
          "Exposure Control and Personal Protection") {
        return index = i;
      }
    }
    return index;
  }

  int health_index() {
    int index = -1;

    for (int i = 0;
        i < widget.info.record.section[safe_id].section[0].section.length;
        i++) {
      if (widget
              .info.record.section[safe_id].section[0].section[i].tocHeading ==
          "Health Hazards") {
        return index = i;
      }
    }
    return index;
  }

  int skin_index() {
    int index = -1;

    for (int i = 0;
        i < widget.info.record.section[safe_id].section[0].section.length;
        i++) {
      if (widget
              .info.record.section[safe_id].section[0].section[i].tocHeading ==
          "Skin, Eye, and Respiratory Irritations") {
        return index = i;
      }
    }
    return index;
  }

  int fire_index() {
    int index = -1;

    for (int i = 0;
        i < widget.info.record.section[safe_id].section[0].section.length;
        i++) {
      if (widget
              .info.record.section[safe_id].section[0].section[i].tocHeading ==
          "Fire Hazards") {
        return index = i;
      }
    }
    return index;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            if (safe_id != -1) ...[
              safety(),
              if (health_id != -1) ...[
                health(),
                Divider(
                  thickness: 2,
                  color: Colors.red,
                ),
              ] else ...[
                Container()
              ],
              if (fire_id != -1) ...[
                fire(),
                Divider(
                  thickness: 2,
                  color: Colors.red,
                ),
              ] else ...[
                Container()
              ],
              if (skin_id != -1) ...[
                skin(),
                Divider(
                  thickness: 2,
                  color: Colors.red,
                ),
              ] else ...[
                Container(),
              ],
              if (first_id != -1) ...[
                firstaid(),
              ] else ...[
                Container()
              ],
              if (prevent_id != -1) ...[
                prevent(),
              ] else ...[
                Container(),
              ]
            ] else ...[
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              Container(
                child: Text(
                  "No Record Found",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: "Spotify",
                      fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
