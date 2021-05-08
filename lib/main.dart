import 'package:chemical/arcore/ar.dart';
import 'package:chemical/arcore/artemp.dart';
import 'package:chemical/jsondata/information_screen/comp_info_main.dart';
import 'package:chemical/jsondata/shimmer/shimmer.dart';
import 'package:chemical/mainscreen/mainscreen.dart';
import 'package:chemical/periodic%20table/elementgrid.dart';


import 'package:flutter/material.dart';


import 'jsondata/infoscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
// router: AppRouter(),
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        theme: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            dividerColor: Colors.blue.shade500),
            
            
        // onGenerateRoute: router.generateRoute,
        // home: Info(),
        // home: artemp(),
        // home: tab_shim(),
        // home: elementgrid(),
        home: mainscreen(),
      ),
    );
  }
}
