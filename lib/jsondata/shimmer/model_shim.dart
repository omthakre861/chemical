import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

class model_shim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size_width = MediaQuery.of(context).size.width;
    double size_height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Container(
          child: SpinKitFadingFour(
            color: Colors.grey.shade500,
            size: 80,
          ),
        )));
  }
}
