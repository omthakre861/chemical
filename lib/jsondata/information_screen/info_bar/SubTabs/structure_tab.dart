import 'package:chemical/jsondata/info_data.dart';
import 'package:chemical/jsondata/infoscreen.dart';
import 'package:flutter/material.dart';

class structure_tab extends StatefulWidget {
  structure_tab({Key key,this.info}) : super(key: key);
  InfoData info;
  @override
  _structure_tabState createState() => _structure_tabState(info);
}

class _structure_tabState extends State<structure_tab> {
  InfoData info;
  _structure_tabState(this.info);
  var id;
  var cryst_id;

  @override
  void initState() {
    super.initState();
    id = ShowSearchAuto.comp.trim();
    cryst_id = info.record.section[0].section[2].section[1].information[1].value.externalDataUrl[0];
    print(cryst_id);
  }

  final TransformationController _transformationController =
      TransformationController();

   final TransformationController _transformationController2 =
      TransformationController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    child: Image.network(
                      "https://pubchem.ncbi.nlm.nih.gov/image/imgsrv.fcgi?cid=$id&t=l",
                      loadingBuilder: (context, child, progress) {
                        return progress == null
                            ? child
                            : Center(child: CircularProgressIndicator());
                      },
                      fit: BoxFit.fill,
                    ),
                  ),
                  // color: Colors.blue,
                ),
              ),
            ),
            // Divider(thickness: 2,indent: 15,endIndent: 15,),
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
                  child: Image.network(
                    cryst_id,
                    loadingBuilder: (context, child, progress) {
                      return progress == null
                          ? child
                          : Center(child: CircularProgressIndicator());
                    },
                    fit: BoxFit.fill,
                  ),
                ),
                // color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
