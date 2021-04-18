import 'package:chemical/constrants/nav_name.dart';
import 'package:chemical/cubit/compound_cubit.dart';
import 'package:chemical/data/compoundData/respository_compound.dart';
import 'package:chemical/data/compoundData/services_compound.dart';
import 'package:chemical/presentation/screens/search.dart';
import 'package:chemical/presentation/screens/compound_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Respository_compound respository_compound;

  AppRouter() {
    respository_compound = Respository_compound(services_compound: Services_compound());
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (BuildContext context) => CompoundCubit(respository_compound: respository_compound ),
              child: search()),
        );
      case COMPOUND_DATA:
        return MaterialPageRoute(
          builder: (_) => compound_data(),
        );
      default:
        return null;
    }
  }
}
