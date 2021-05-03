import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class safe_shim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size_width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 8,
          itemBuilder: (context, index) => Opacity(
            opacity: 0.6,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 3, left: 8, right: 8, bottom: 3),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[800],
                    highlightColor: Colors.grey[600],
                    child: Container(
                      width: size_width,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Shimmer.fromColors(
                    baseColor: Colors.black,
                    highlightColor: Colors.red,
                    child: Divider(
                      thickness: 2,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
