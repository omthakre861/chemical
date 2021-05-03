import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class toxic_shim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => Card(
            color: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.all(8),
            child: Opacity(
              opacity: 0.6,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[800],
                highlightColor: Colors.grey[600],
                child: Container(
                  width: 100,
                  height: 230,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
