import 'dart:convert';

import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'model/element.dart';
import 'model/grid.dart';

class elementgrid extends StatefulWidget {
  elementgrid({Key key}) : super(key: key);

  @override
  _elementgridState createState() => _elementgridState();
}

class _elementgridState extends State<elementgrid> {
  List<mElement> elements = [];

  Future<String> loadElementsFromAssets() async {
    return await rootBundle.loadString('asset/periodictable.json');
  }

  Future loadElements() async {
    String jsonString = await loadElementsFromAssets();
    final jsonRes = json.decode(jsonString);

    for (int i = 0; i < jsonRes.length; i++) {
      mElement element = new mElement.fromJson(jsonRes[i]);

      if (elements.length == jsonRes.length) {
        return;
      }
      elements.add(element);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.grey.shade900,
        elevation: 0.0,
        title: Text("Periodic Table",
            style: TextStyle(
              fontFamily: "Spotify",
              fontSize: 25,
              fontWeight: FontWeight.w800,
            )),
      ),
      body: FutureBuilder(
        future: loadElements(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildGrid();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildGrid() {
    return SafeArea(
      child: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.grey.shade900,
          child: OrientationBuilder(builder: (context, orientation) {
            return Stack(
              clipBehavior: Clip.antiAlias,
              children: <Widget>[
                FutureBuilder(
                  future: buildGridItems(context),
                  builder: (context, snapshot) {
                    return GridView.count(
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        primary: false,
                        shrinkWrap: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        scrollDirection: orientation == Orientation.portrait
                            ? Axis.horizontal
                            : Axis.vertical,
                        crossAxisCount: orientation == Orientation.portrait
                            ? grid.length
                            : grid[0].length,
                        children:
                            snapshot.connectionState == ConnectionState.done
                                ? snapshot.data
                                : <Widget>[
                                    Center(
                                      child: SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  ]);
                  },
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  Future<List<Widget>> buildGridItems(BuildContext context) async {
    List<Widget> gridItems = [];

    Orientation orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape) {
      for (var i = 0; i < grid.length; i++) {
        for (var j = 0; j < grid[0].length; j++) {
          await buildGridItem(i, j).then((item) => gridItems.add(item));
        }
      }
    }

    if (orientation == Orientation.portrait) {
      for (var i = 0; i < grid[0].length; i++) {
        for (var j = 0; j < grid.length; j++) {
          await buildGridItem(j, i).then((item) => gridItems.add(item));
        }
      }
    }

    return gridItems;
  }

  Future<Widget> buildGridItem(int x, int y) async {
    Orientation orientation = MediaQuery.of(context).orientation;
    TextStyle textStyle =
        TextStyle(fontFamily: "Spotify", fontSize: 22, color: Colors.black);
    Widget tile;
    mElement element;

    for (mElement el in elements) {
      if (grid[x][y] == el.number.toString()) {
        element = el;
        tile = Container(
          decoration: BoxDecoration(
            color: mElement.getColorByElCat(el),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          // decoration: BoxDecoration(
          //     border: Border.all(
          //       color: mElement.getColorByElCat(el),
          //     ),
          //     borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,
            children: <Widget>[
              Container(
                alignment: Alignment(0.9, -0.9),
                child: Text(
                  el.number.toString(),
                  style: TextStyle(
                      color: Colors.white, fontSize: 13, fontFamily: "Spotify"),
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    el.atomicMass.toStringAsFixed(1),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontFamily: "Spotify"),
                  ),
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    orientation != Orientation.landscape
                        ? Text(
                            el.symbol,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "Spotify"),
                          )
                        : Text(
                            el.symbol,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontFamily: "Spotify"),
                          ),
                    orientation != Orientation.landscape
                        ? Text(
                            el.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 9.0,
                                fontFamily: "Spotify"),
                            overflow: TextOverflow.ellipsis,
                          )
                        : SizedBox()
                  ],
                ),
              ),
            ],
          ),
        );
      } else if (grid[x][y] == '#') {
        tile = Container(
          color: Colors.grey.shade900,
        );
      }
    }

    return GestureDetector(
        onTap: grid[x][y] == '#'
            ? null
            : () {
                showModalBottomSheet(
                  backgroundColor: Colors.white,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  context: context,
                  builder: (context) {
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .60,
                        color: Colors.transparent,
                        child: ListView(
                          children: [
                            Center(
                              child: Text(element.name,
                                  style: TextStyle(
                                    fontFamily: "Spotify",
                                    fontSize: 35,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Symbol", style: textStyle),
                                  Text(
                                    element.symbol,
                                    style: textStyle,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Category", style: textStyle),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: mElement.getColorByElCat(element),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 8,
                                    ),
                                    child: Text(
                                      element.category,
                                      style: TextStyle(
                                        fontFamily: "Spotify",
                                        fontSize: 22,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Atomic Mass", style: textStyle),
                                  Text(
                                    element.atomicMass.toStringAsFixed(3) +
                                        " g/mol",
                                    style: textStyle,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Atomic Number", style: textStyle),
                                  Text(
                                    element.number.toString(),
                                    style: textStyle,
                                  ),
                                ],
                              ),
                            ),
                            if (element.boil != null) ...[
                              Container(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Boiling Point", style: textStyle),
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            element.boil.toString() + " K",
                                            style: textStyle,
                                          ),
                                          Text(
                                            (element.boil - 273.15)
                                                    .toStringAsFixed(3) +
                                                " °C",
                                            style: textStyle,
                                          ),
                                          Text(
                                            ((element.boil - 273.15) * 9 / 5 +
                                                        32)
                                                    .toStringAsFixed(3) +
                                                " °F",
                                            style: textStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ] else ...[
                              SizedBox()
                            ],
                            if (element.melt != null) ...[
                              Container(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Melting Point", style: textStyle),
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            element.melt.toString() + " K",
                                            style: textStyle,
                                          ),
                                          Text(
                                            (element.melt - 273.15)
                                                    .toStringAsFixed(3) +
                                                " °C",
                                            style: textStyle,
                                          ),
                                          Text(
                                            ((element.melt - 273.15) * 9 / 5 +
                                                        32)
                                                    .toStringAsFixed(3) +
                                                " °F",
                                            style: textStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ] else ...[
                              SizedBox()
                            ],
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Density", style: textStyle),
                                  Text(
                                    element.density.toString() + " g/L",
                                    style: textStyle,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Period", style: textStyle),
                                  Text(
                                    element.period.toString(),
                                    style: textStyle,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Phase", style: textStyle),
                                  Text(
                                    element.phase.toString(),
                                    style: textStyle,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Electron \nConfiguration",
                                      style: textStyle),
                                  ConstrainedBox(
                                    constraints: BoxConstraints.loose(
                                        Size.fromWidth(200)),
                                    child: EasyRichText(
                                      element.electronConfigSemantic.toString(),
                                      defaultStyle: textStyle,
                                      patternList: [
                                        EasyRichTextPattern(
                                            targetString: '[0-9]*',
                                            stringAfterTarget: '[s,p,d,f," "]*',
                                            superScript: true,
                                            matchLeftWordBoundary: false,
                                            style: TextStyle(
                                              fontFamily: "Spotify",
                                              fontSize: 28,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (element.electronAffinity != null) ...[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Electron \nAffinity",
                                        style: textStyle),
                                    Text(
                                      element.electronAffinity.toString() +
                                          " kJ/mol",
                                      style: textStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ] else ...[
                              SizedBox()
                            ],
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Discovered by", style: textStyle),
                                  ConstrainedBox(
                                    constraints: BoxConstraints.loose(
                                        Size.fromWidth(180)),
                                    child: Container(
                                      child: Text(
                                        element.discoveredBy.toString(),
                                        style: textStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
        child: GridTile(
          child: Container(
            child: tile,
          ),
        ));
  }
}
