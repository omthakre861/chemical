import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:chemical/jsondata/infoscreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import '../../../info_data.dart';

class home_tab extends StatefulWidget {
  home_tab({Key key, this.info}) : super(key: key);

  InfoData info;

  @override
  _home_tabState createState() => _home_tabState();
}

class _home_tabState extends State<home_tab> {
  var id = ShowSearchAuto.comp;
  int mol_id;
  int safe_id;
  int iupac_id;
  int comput_id;
  int mol_formu_id;
  int insight_id;

  @override
  void initState() {
    super.initState();
    safe_id = safe_index();
    print("Safe");
    print(safe_id);
    mol_id = mol_index();
    print("mol");
    print(mol_id);
    mol_formu_id = mol_formula_index();
    print("molfor");
    print(mol_formu_id);
    comput_id = compu_index();
    print("comp");
    print(comput_id);
    iupac_id = iupac_index();
    print("iupac");
    print(iupac_id);
    insight_id = insight_index();
    print("insight");
    print(insight_id);
  }

  int mol_index() {
    int index = -1;

    for (int i = 0; i < widget.info.record.section.length; i++) {
      if (widget.info.record.section[i].tocHeading == "Names and Identifiers") {
        return index = i;
      }
    }
    return index;
  }

  int insight_index() {
    int index = -1;

    for (int i = 0;
        i < widget.info.record.section[mol_id].section.length;
        i++) {
      if (widget.info.record.section[mol_id].section[i].tocHeading ==
          "Record Description") {
        return index = i;
      }
    }
    return index;
  }

  int mol_formula_index() {
    int index = -1;

    for (int i = 0;
        i < widget.info.record.section[mol_id].section.length;
        i++) {
      if (widget.info.record.section[mol_id].section[i].tocHeading ==
          "Molecular Formula") {
        return index = i;
      }
    }
    return index;
  }

  int safe_index() {
    int index = -1;

    for (int i = 0; i < widget.info.record.section.length; i++) {
      if (widget.info.record.section[i].tocHeading == "Chemical Safety") {
        return index = i;
      }
    }
    return index;
  }

  int iupac_index() {
    int index = -1;

    for (int i = 0;
        i <
            widget
                .info.record.section[mol_id].section[comput_id].section.length;
        i++) {
      if (widget.info.record.section[mol_id].section[comput_id].section[i]
              .tocHeading ==
          "IUPAC Name") {
        return index = i;
      }
    }
    return index;
  }

  int compu_index() {
    int index = -1;

    for (int i = 0;
        i < widget.info.record.section[mol_id].section.length;
        i++) {
      if (widget.info.record.section[mol_id].section[i].tocHeading ==
          "Computed Descriptors") {
        return index = i;
      }
    }
    return index;
  }

  BoxDecoration box = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );

  TextStyle textStyle = TextStyle(
    fontSize: 45,
    fontFamily: "Spotify",
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );

  Widget signssvg() {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.spaceEvenly,
      spacing: 20,
      runSpacing: 20,

      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.info.record.section[safe_id].information[0].value
          .stringWithMarkup[0].markup
          .map((u) {
        return Container(
          child: Column(
            children: [
              SvgPicture.network(u.url,
                  placeholderBuilder: (BuildContext context) => Container(
                        width: 50,
                        padding: EdgeInsets.all(5),
                        child: SpinKitDoubleBounce(
                          color: Color(0xffbbb2e9),
                        ),
                      )),
              Text(
                u.extra,
                style: TextStyle(
                    fontFamily: "Spotify",
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget molec_form() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 5, left: 5, right: 5),
          // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          alignment: Alignment.centerLeft,
          child: Text(
            "Molecular Formula",
            style: TextStyle(
                fontFamily: "Spotify", fontSize: 30, color: Colors.amber),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          decoration: box,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: EasyRichText(
            widget.info.record.section[mol_id].section[mol_formu_id]
                .information[0].value.stringWithMarkup[0].string,
            defaultStyle: TextStyle(
                fontFamily: "Spotify",
                fontSize: 50,
                fontWeight: FontWeight.w800,
                color: Colors.black),
            patternList: [
              EasyRichTextPattern(
                targetString: '[0-9]*',
                subScript: true,
                matchWordBoundaries: false,
                style: TextStyle(
                    fontFamily: "Spotify",
                    fontSize: 40,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget mole_weight() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 5, left: 5, right: 5),
          // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          alignment: Alignment.centerLeft,
          child: Text(
            "Molecular Weight",
            style: TextStyle(
                fontFamily: "Spotify", fontSize: 30, color: Colors.amber),
          ),
        ),
        Container(
            // margin: EdgeInsets.all(5),
            decoration: box,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: RichText(
                text: TextSpan(
                    style: TextStyle(
                      fontSize: 45,
                      fontFamily: "Spotify",
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                  TextSpan(
                      text: widget.info.record.section[mol_id + 1].section[0]
                          .section[0].information[0].value.number[0]
                          .toString()),
                  TextSpan(
                      text: " g/mol",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Spotify",
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ))
                ]))),
      ],
    );
  }

  Widget iupac() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15, left: 5, right: 5),
          // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          alignment: Alignment.centerLeft,
          child: Text(
            "IUPAC Name",
            style: TextStyle(
                fontFamily: "Spotify", fontSize: 30, color: Colors.amber),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            widget
                .info
                .record
                .section[mol_id]
                .section[comput_id]
                .section[iupac_id]
                .information[0]
                .value
                .stringWithMarkup[0]
                .string,
            style: TextStyle(
              fontSize: 30,
              fontFamily: "Spotify",
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
          decoration: box,
        ),
      ],
    );
  }

  Widget insight() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15, left: 5, right: 5),
          // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          alignment: Alignment.centerLeft,
          child: Text(
            "Insight",
            style: TextStyle(
                fontFamily: "Spotify", fontSize: 30, color: Colors.amber),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: box,
          // color: Colors.blue,
          child: ExpandText(
            widget.info.record.section[mol_id].section[0].information[0].value
                .stringWithMarkup[0].string,
            style: TextStyle(
              fontSize: 25,
              fontFamily: "Spotify",
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
            maxLines: 5,
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        // margin: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            // Container(
            //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     "Compound Name",
            //     style: TextStyle(
            //       fontSize: 40,
            //       fontFamily: "Spotify",
            //       fontWeight: FontWeight.w700,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff8E6BBF),
                    Color(0xff003F63),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  widget.info.record.recordTitle,
                  style: textStyle,
                ),
              ),
            ),

            if ((safe_id != -1) &&
                (widget.info.record.section[safe_id].information[0].value
                        .stringWithMarkup.length !=
                    0)) ...[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Chemical Safety",
                  style: TextStyle(
                      fontFamily: "Spotify", fontSize: 30, color: Colors.amber),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  decoration: box,
                  child: signssvg()),
            ] else ...[
              SizedBox(),
            ],

            if (mol_id != -1) ...[
              molec_form(),
              mole_weight(),
            ] else ...[
              SizedBox(),
            ],
            if (iupac_id != -1) ...[
              iupac(),
            ] else ...[
              SizedBox(),
            ],
            if (insight_id != -1) ...[
              insight(),
            ] else ...[
              SizedBox(),
            ]
          ],
        ),
      ),
    );
  }
}
