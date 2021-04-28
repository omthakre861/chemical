
import 'package:chemical/jsondata/info_data.dart';
import 'package:flutter/material.dart';

class properties_tab extends StatefulWidget {
  properties_tab({Key key, this.info}) : super(key: key);

  InfoData info;

  @override
  _properties_tabState createState() => _properties_tabState();
}

class _properties_tabState extends State<properties_tab> {
  int comp_ind;
  int exe_ind;
  
  
  
  @override
  void initState() {
    super.initState();
    comp_ind = index();
    exe_ind = exp_ind();
  }

  int index() {
    int index = -1;

    for (int i = 0; i < widget.info.record.section.length; i++) {
      if (widget.info.record.section[i].tocHeading ==
          "Chemical and Physical Properties") {
        return index = i;
       
      }
    }
    return index;
  }

  int exp_ind() {
    int exp_index = -1;

    for (int i = 0;
        i < widget.info.record.section[comp_ind].section.length;
        i++) {
      if (widget.info.record.section[comp_ind].section[i].tocHeading ==
          "Experimental Properties") {
        exp_index = i;
        print(exp_index);
        break;
      }
    }
    return exp_index;
  }

  Widget table() => DataTable(
      columnSpacing: 4,
      // dividerThickness: 3,
      // horizontalMargin: 40,
      dataRowHeight: 60,
      // showBottomBorder: true,'
      showBottomBorder: true,
      columns: <DataColumn>[
        DataColumn(
          label: Text("Property Name",
              style: TextStyle(
                  fontFamily: "Spotify",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Color(0xffbbb2e9))),
          numeric: false,
        ),
        DataColumn(
            label: Text(
              "Property Value",
              style: TextStyle(
                  fontFamily: "Spotify",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Color(0xffbbb2e9)),
            ),
            numeric: false),
      ],
      rows: widget.info.record.section[comp_ind].section[0].section
          .map((name) => DataRow(cells: [
                DataCell(
                    Container(
                      // padding: EdgeInsets.all(4),
                      width: 200,
                      child: Text(
                        name.tocHeading,
                        style: TextStyle(
                            fontFamily: "Spotify",
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                    showEditIcon: false,
                    placeholder: false),
                DataCell(
                    Container(
                      width: 180,
                      child: Text(
                        (() {
                          if (name.information[0].value.number != null) {
                            if (name.information[0].value.unit == null) {
                              return name.information[0].value.number[0]
                                  .toString();
                            } else {
                              return name.information[0].value.number[0]
                                      .toString() +
                                  " " +
                                  name.information[0].value.unit;
                            }
                          } else {
                            return name.information[0].value.stringWithMarkup[0]
                                .string;
                            //           .information[0].value.stringWithMarkup[0].string
                          }
                        }()),
                        style: TextStyle(
                            fontFamily: "Spotify",
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),

                    // Text(
                    //   (name.information[0].value.number != null)
                    //       ? ((name.information[0].value.unit !=null) ? (name.information[0].value.number[0].toString()):(name.information[0].value.number[0].toString()+" "+name.information[0].value.unit))
                    //       : name
                    //           .information[0].value.stringWithMarkup[0].string,
                    //   style: TextStyle(
                    //       fontFamily: "Spotify",
                    //       fontWeight: FontWeight.w300,
                    //       fontSize: 18,
                    //       color: Colors.white),
                    // ),
                    showEditIcon: false,
                    placeholder: false),
              ]))
          .toList());

  Widget expermential_table(BuildContext context) {
    

    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget
            .info.record.section[comp_ind].section[exe_ind].section.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 8,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.all(8),

            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            // color: Colors.purple.shade600,

            child: Container(
                padding: EdgeInsets.all(15),
                color: Colors.indigo,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.info.record.section[comp_ind].section[exe_ind].section[index]
                            .tocHeading,
                        style: TextStyle(
                            color: Colors.teal.shade200,
                            fontSize: 25,
                            fontFamily: "Spotify",
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                          (() {
                            if (widget
                                    .info
                                    .record
                                    .section[comp_ind]
                                    .section[exe_ind]
                                    .section[index]
                                    .information[0]
                                    .value
                                    .stringWithMarkup !=
                                null) {
                              return widget
                                  .info
                                  .record
                                  .section[comp_ind]
                                  .section[exe_ind]
                                  .section[index]
                                  .information[0]
                                  .value
                                  .stringWithMarkup[0]
                                  .string;
                            } else {
                              return widget.info.record.section[comp_ind].section[exe_ind]
                                  .section[index].information[0].value.number[0]
                                  .toString();
                            }
                          }()),
                          // overflow: TextOverflow.ellipsis,
                          // maxLines: 7,

                          style: TextStyle(
                              fontFamily: "Spotify",
                              fontSize: 20,
                              color: Colors.yellow.shade400,
                              fontWeight: FontWeight.w500)),
                    )
                  ],
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle mediumtext = TextStyle(
        fontFamily: "Spotify",
        fontWeight: FontWeight.w400,
        fontSize: 30,
        color: Color(0xffbbb2e9)
        // color: Colors.purple.shade300
        );

    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                // color: Colors.black,
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Computed Properties",
                  style: mediumtext,
                ),
                // color: Colors.blue,
              ),
              Container(
                  width: MediaQuery.of(context).size.width, child: table()),
              SizedBox(
                height: 20,
              ),
              if (exe_ind != -1) ...[
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Experimental Properties",
                    style: mediumtext,
                  ),
                ),
                expermential_table(context)
              ] else ...[
                Container()
              ]
            ],
          ),
        ),
      ),
    );
  }
}
