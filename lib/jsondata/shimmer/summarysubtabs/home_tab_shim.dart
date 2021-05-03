import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class home_shim extends StatelessWidget {
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
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                alignment: Alignment.center,
                margin: EdgeInsets.all(15),
                child: Opacity(
                  opacity: 0.6,
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
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                alignment: Alignment.centerLeft,
                child: Opacity(
                  opacity: 0.6,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[800],
                    highlightColor: Colors.grey[600],
                    child: Container(
                      width: size_width - 150,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Opacity(
                  opacity: 0.6,
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
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                alignment: Alignment.centerLeft,
                child: Opacity(
                  opacity: 0.6,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[800],
                    highlightColor: Colors.grey[600],
                    child: Container(
                      width: size_width - 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Opacity(
                  opacity: 0.6,
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
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                alignment: Alignment.centerLeft,
                child: Opacity(
                  opacity: 0.6,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[800],
                    highlightColor: Colors.grey[600],
                    child: Container(
                      width: size_width - 120,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Opacity(
                  opacity: 0.6,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
