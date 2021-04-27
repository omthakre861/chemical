import 'package:chemical/arcore/ar.dart';
import 'package:chemical/jsondata/information_screen/comp_info_main.dart';
import 'package:chemical/presentation/screens/compound_info.dart';
import 'package:flutter/material.dart';

import 'jsondata/infoscreen.dart';
import 'pages/homePage.dart';
import '3dview/3dView.dart';
import 'presentation/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
// router: AppRouter(),
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter router;
  const MyApp({Key key, this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        },
          child: MaterialApp(
            theme: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        dividerColor: Colors.blue.shade500
      ),
        // onGenerateRoute: router.generateRoute,
        home: Info(),
      ),
    );
  }
}
