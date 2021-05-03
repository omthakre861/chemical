import 'package:chemical/jsondata/infoscreen.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArView extends StatefulWidget {
  @override
  _ArViewState createState() => _ArViewState();
}

class _ArViewState extends State<ArView> {
  int objectplaced = 0;
  String id;
  String objectPath;
  @override
  void initState() {
    id = ShowSearchAuto.comp.trim();
    objectPath = "http://192.168.1.3:5000/files/$id.glb";
    super.initState();
  }

  ArCoreController arCoreController;

  void _onArCoreViewCreated(ArCoreController _arcoreController) {
    arCoreController = _arcoreController;
    arCoreController.onNodeTap = (name) => onTapHandler(name);
    arCoreController.onPlaneTap = _handleOnPlaneTap;
  }

  void _addcompound(ArCoreHitTestResult plane) {
    final compoundNode = ArCoreReferenceNode(
        name: "2244",
        // object3DFileName: "/storage/emulated/0/Chemical/bin/glb/2244.glb",

        // objectUrl: "http://10.0.2.2:8000/files/2244.glb",
        // objectUrl: "http://192.168.1.3:8080/files/2244.glb",
        objectUrl: objectPath,
        position: plane.pose.translation,
        rotation: plane.pose.rotation);
    arCoreController.addArCoreNodeWithAnchor(compoundNode);
  }

  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.first;
    objectplaced++;

    if (objectplaced == 1) {
      _addcompound(hit);
    }
  }

  void onTapHandler(String name) {
    print("Flutter OnNodeTap");
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Row(
          children: <Widget>[
            Text('Remove $name?'),
            IconButton(
                icon: Icon(
                  Icons.delete,
                ),
                onPressed: () {
                  objectplaced = 0;
                  arCoreController.removeNode(nodeName: name);
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
        enableTapRecognizer: true,
        
      ),
    );
  }
}
