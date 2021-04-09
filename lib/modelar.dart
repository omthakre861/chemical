import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';

class modelar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Model Viewer")),
        body: ModelViewer(
          backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
          src:
              'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
          alt: "Bistecca",
          ar: true,
          autoRotate: true,
          cameraControls: true,
        ),
      ),
    );
  }
}
