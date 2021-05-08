import 'package:flutter/material.dart';

class mainscreen extends StatefulWidget {
  mainscreen({Key key}) : super(key: key);

  @override
  _mainscreenState createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203a43), Color(0xFF2C5364)],
            begin: Alignment.topCenter,
          )),
          child: Stack(
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
                  Stack(children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 55),
                      width: MediaQuery.of(context).size.width - 40,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(colors: [
                          Color(0XFF014040),
                          Color(0XFF027367),
                        ]),
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
                    Positioned(
                      bottom: 53,
                      left: 20,
                      child: Container(
                        width: 600,
                        child: Image.asset(
                          'asset/241.png',
                        ),
                      ),
                    ),
                  ]),
                  Stack(children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                              colors: [Color(0xFFA6212C), Color(0xFFBF565F)])),
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
