import 'package:cached_network_image/cached_network_image.dart';
import 'package:chemical/jsondata/info_data.dart';
import 'package:chemical/jsondata/infoscreen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class structure_tab extends StatefulWidget {
  structure_tab({Key key, this.info}) : super(key: key);
  InfoData info;
  @override
  _structure_tabState createState() => _structure_tabState(info);
}

class _structure_tabState extends State<structure_tab> {
  InfoData info;
  _structure_tabState(this.info);
  var id;
  var cryst_id;

  int cryst_index;
  int cryst_data;

  int crsy() {
    int index = -1;
    for (int i = 0; i < info.record.section[0].section.length; i++) {
      if (info.record.section[0].section[i].tocHeading ==
          "Crystal Structures") {
        index = i;
        break;
      }
    }
    return index;
  }

  int crsy_data() {
    int index = -1;
    for (int i = 0;
        i < info.record.section[0].section[cryst_index].section.length;
        i++) {
      if (info.record.section[0].section[cryst_index].section[i].tocHeading ==
          "Crystal Structure Data") {
        index = i;
        break;
      }
    }
    return index;
  }

  @override
  void initState() {
    super.initState();
    id = ShowSearchAuto.comp.trim();
    cryst_index = crsy();
    print("cryst_index");
    print(cryst_index);
    cryst_data = crsy_data();
    print("cryst_data");
    print(cryst_data);

    if (cryst_index != -1 && cryst_data != -1) {
      cryst_id = info.record.section[0].section[2].section[cryst_data]
          .information[1].value.externalDataUrl[0];
    } else {
      cryst_id = "";
    }

    // print(cryst_id);
  }

  final TransformationController _transformationController =
      TransformationController();

  final TransformationController _transformationController2 =
      TransformationController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        child: Column(
          children: <Widget>[
            // SizedBox(height: 20,),
            Container(
              // color: Colors.deepPurple.shade700,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                "2D Structure",
                style: TextStyle(
                    color: Color(0xffbbb2e9),
                    fontSize: 45,
                    fontFamily: "Spotify",
                    fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              // color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Container(
                width: MediaQuery.of(context).size.width - 10,
                margin: EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: InteractiveViewer(
                    transformationController: _transformationController,
                    onInteractionEnd: (details) {
                      _transformationController.value = Matrix4.identity();
                    },
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://pubchem.ncbi.nlm.nih.gov/image/imgsrv.fcgi?cid=$id&t=l",
                      placeholder: (context, url) => Shimmer.fromColors(
                        child: Container(
                            height: 350, width: 200, color: Colors.black),
                        baseColor: Colors.grey[800],
                        highlightColor: Colors.grey[600],
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.fill,
                    ),
                  ),
                  // color: Colors.blue,
                ),
              ),
            ),
            // Divider(thickness: 2,indent: 15,endIndent: 15,),
            if (cryst_id != "") ...[
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 10),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "Crystal Structure",
                    style: TextStyle(
                        color: Color(0xffbbb2e9),
                        fontSize: 45,
                        fontFamily: "Spotify",
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                width: MediaQuery.of(context).size.width - 10,
                margin: EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: InteractiveViewer(
                    transformationController: _transformationController2,
                    onInteractionEnd: (details) {
                      _transformationController2.value = Matrix4.identity();
                    },
                    child: CachedNetworkImage(
                      imageUrl: cryst_id,
                      placeholder: (context, url) => Shimmer.fromColors(
                        child: Container(
                            height: 350, width: 200, color: Colors.black),
                        baseColor: Colors.grey[800],
                        highlightColor: Colors.grey[600],
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.fill,
                    ),
                  ),
                  // color: Colors.blue,
                ),
              ),
            ] else ...[
              Container(),
            ],
          ],
        ),
      ),
    );
  }
}
