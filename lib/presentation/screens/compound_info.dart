import 'package:chemical/cubit/compound_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class compound_data extends StatefulWidget {
  @override
  _compound_dataState createState() => _compound_dataState();
}

class _compound_dataState extends State<compound_data> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CompoundCubit>(context).fetchinfo("2244");

    return Scaffold(
      body: Center(child: Text("screen")),
    );
  }
}
