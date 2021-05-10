import 'package:chemical/jsondata/infoscreen.dart';
import 'package:chemical/periodic%20table/elementgrid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class mainscreen extends StatefulWidget {
  mainscreen({Key key}) : super(key: key);

  @override
  _mainscreenState createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xFF0F2027), Color(0xFF203a43), Color(0xFF2C5364)],
              begin: Alignment.topCenter,
            )),
            child: Stack(
              clipBehavior: Clip.antiAlias,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Explore",
                        style: TextStyle(
                            fontFamily: "Spotify",
                            fontSize: 40,
                            color: Colors.white),
                      ),
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.15,
                    // ),
                    InkWell(
                      onTap: () {
                        return Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Info(),
                        ));
                      },
                      child: Stack(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 55),
                              width: MediaQuery.of(context).size.width - 40,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                gradient: LinearGradient(colors: [
                                  Color(0XFF014040),
                                  Color(0XFF027367),
                                ]),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 2.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(4.0,
                                        4.0), // shadow direction: bottom right
                                  )
                                ],
                              ),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "Compound",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Spotify",
                                    fontSize: 35,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 200,
                              child: Image.asset(
                                'asset/4.png',
                              ),
                            ),
                          ]),
                    ),
                    InkWell(
                      onTap: () {
                        return Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => elementgrid(),
                        ));
                      },
                      child: Stack(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                gradient: LinearGradient(colors: [
                                  Color(0xFF6C1023),
                                  Color(0xFF7B2E42)
                                ]),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 2.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(4.0,
                                        4.0), // shadow direction: bottom right
                                  )
                                ],
                              ),
                              child: Container(
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 5),
                                child: Text(
                                  "Periodic Table",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Spotify",
                                    fontSize: 35,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 30,
                              top: 30,
                              child: Container(
                                  width: 140,
                                  child: Image.asset("asset/periodic.png")),
                            )
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
