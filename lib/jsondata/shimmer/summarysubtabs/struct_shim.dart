import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class struct_shim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size_width = MediaQuery.of(context).size.width;
    double size_height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
                child: Opacity(
                  opacity: 0.6,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[800],
                    highlightColor: Colors.grey[600],
                    child: Container(
                      width: size_width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
                child: Opacity(
                  opacity: 0.6,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[800],
                    highlightColor: Colors.grey[600],
                    child: Container(
                      width: size_width,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
                child: Opacity(
                  opacity: 0.6,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[800],
                    highlightColor: Colors.grey[600],
                    child: Container(
                      width: size_width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
                child: Opacity(
                  opacity: 0.6,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[800],
                    highlightColor: Colors.grey[600],
                    child: Container(
                      width: size_width,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
