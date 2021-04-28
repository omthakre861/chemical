import 'package:chemical/jsondata/info_data.dart';
import 'package:expand_widget/expand_widget.dart';

import 'package:flutter/material.dart';

class toxicity_tab extends StatefulWidget {
  toxicity_tab({Key key, this.info}) : super(key: key);
  InfoData info;

  
  @override
  _toxicity_tabState createState() => _toxicity_tabState();
}

class _toxicity_tabState extends State<toxicity_tab> {
  int comp_ind;
  int tox_ind;
  @override
  void initState() {
    super.initState();
    comp_ind = index();
    tox_ind = toxi_ind();
  }

  int index() {
    int index = -1;

    for (int i = 0; i < widget.info.record.section.length; i++) {
      if (widget.info.record.section[i].tocHeading == "Toxicity") {
        index = i;
        break;
      }
    }
    return index;
  }

  int toxi_ind() {
    int tox_index = -1;

    for (int i = 0;
        i < widget.info.record.section[comp_ind].section.length;
        i++) {
      if (widget.info.record.section[comp_ind].section[i].tocHeading ==
          "Ecological Information") {
        tox_index = i;
        print(tox_index);
        break;
      }
    }
    return tox_index;
  }

  Widget tox_table(BuildContext context) {
    List<String> head = ["Natural Pollution Sources","Artificial Pollution Sources","Environmental Fate","Environmental Biodegradation","Environmental Abiotic Degradation","Environmental Bioconcentration","Soil Adsorption/Mobility","Volatilization from Water/Soil","Environmental Water Concentrations","Effluent Concentrations","Atmospheric Concentrations","Food Survey Values","Fish/Seafood Concentrations","Other Environmental Concentrations","Average Daily Intake"];

    return ListView.builder(
        itemCount: widget
            .info.record.section[comp_ind].section[tox_ind].section.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          if (head.contains(widget.info.record.section[comp_ind].section[tox_ind].section[index].tocHeading)) {
            return Card(
              color: Color(0xFF93b7bf),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 8,
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.all(8),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        widget.info.record.section[comp_ind].section[tox_ind]
                            .section[index].tocHeading,
                        style: TextStyle(
                            color: Color(0xff011126),
                            fontSize: 28,
                            fontFamily: "Spotify",
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    ExpandText(
                      widget
                          .info
                          .record
                          .section[comp_ind]
                          .section[tox_ind]
                          .section[index]
                          .information[0]
                          .value
                          .stringWithMarkup[0]
                          .string,
                      style: TextStyle(
                        fontFamily: "Spotify",
                        fontWeight: FontWeight.w200,
                        color: Color(0xfff2f2f2),
                        fontSize: 20,
                        wordSpacing: 2,
                      ),

                      // animationDuration: ,
                      
                      maxLines: 4,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      animationDuration: Duration(milliseconds: 800),
                     
                    ),
                  ],
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              if(tox_ind != -1)...[
                tox_table(context)

              ]
              else ...[
                // Container(
                //   child: Icon(Icons.search_off_rounded,color: Colors.teal,size: 150,),
                // ),
                Container(
                  
                  child: Text("No Record Found",style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontFamily: "Spotify",
                                fontWeight: FontWeight.w800),
                          ),
                ),
              ]
              
              ],
          ),
        ),
      ),
    );
  }
}
