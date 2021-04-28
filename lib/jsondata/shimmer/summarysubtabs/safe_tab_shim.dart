import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class safe_shim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[800],
        highlightColor: Colors.grey[600],
          child: Container(
            
            padding: EdgeInsets.all(8),
        width: 200,
        height: 200,
      ),
    );
  }
}