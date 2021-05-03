import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class property_shim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size_width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[800],
                  highlightColor: Colors.grey[600],
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    width: size_width,
                    height: 50,
                  ),
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 18,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                            margin: EdgeInsets.all(10),
                            width: size_width,
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    child: Shimmer.fromColors(
                                  child: Container(
                                    width: 150,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                  ),
                                  baseColor: Colors.grey[800],
                                  highlightColor: Colors.grey[600],
                                )),
                                Container(
                                    child: Shimmer.fromColors(
                                  child: Container(
                                    width: 150,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                  ),
                                  baseColor: Colors.grey[800],
                                  highlightColor: Colors.grey[600],
                                )),
                              ],
                            )),
                        Shimmer.fromColors(
                            baseColor: Colors.black,
                            highlightColor: Colors.blue.shade500,
                            child: Divider(
                                thickness: 1, color: Colors.blue.shade500)),
                      ],
                    );
                  })
            ],
          ),
        ));
  }
}
