import 'package:chemical/jsondata/infobloc.dart';
import 'package:flutter/material.dart';
import "services.dart";
import 'meltingpoint.dart';
// import 'user.dart';

class jsonParse extends StatefulWidget {
  @override
  _jsonParseState createState() => _jsonParseState();
}

class _jsonParseState extends State<jsonParse> {
  // <Info> _info;
  // bool _loading;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _loading = true;
  //   Services.getInfo().then((info) {
  //     setState(() {
  //       _info = info;
  //       _loading = false;
  //     });
  //   });
  // }

  void compoundsearch(coumpound_id) async {
    Servicess inst = Servicess();
    inst.compound = coumpound_id;
    await inst.getInfo();
  }

  // Future<Info> getInfo;
  final infobloc = InfoBloc();
  // void compoundsearch() async {
  //   Servicess inst = Servicess();
  //   await inst.getInfo();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    infobloc.eventSink.add(infoAction.Fetch);
    // compoundsearch();
    //fo = Services().getInfo();
  }
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    infobloc.eventSink.add(infoAction.Fetch);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    infobloc.dispose();
    super.dispose();
  }

  var _textcontroller = TextEditingController();
  var compound_id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Search"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                })
          ],
        ),
        // body: Container(
        //   child: ListView.builder(
        //       itemCount: _info == null ? 0 : _info.length,
        //       itemBuilder: (context, index) {
        //         Info info = _info[index];
        //         print(_info);
        //         return ListTile(
        //           title: Text(info.record.recordTitle),
        //           subtitle: Text("Boi"),
        //         );
        //       }),
        // ),
        body: Column(
          children: <Widget>[
            Container(
              height: 200,
              child: TextField(
                controller: _textcontroller,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Enter a search term'),
              ),
            ),
            ElevatedButton(
                child: Text("Submit"),
                onPressed: () {
                  setState(() {
                  compound_id = _textcontroller.text;
                  compoundsearch(compound_id);
                  
                    
                  });
                }),
            name(),
          ],
        ));
  }

  StreamBuilder<Inform> name() {
    return StreamBuilder<Inform>(
      stream: infobloc.infoStream,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error ?? 'Error'),
          );
        }
        if (snapshot.hasData) {
          return Center(
              child: Text(
            data.record.recordTitle,
            style: TextStyle(fontSize: 25),
          ));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = [
    "2244",
    "Agra",
    "Delhi",
    "Pune",
    "Nagpur",
    "Lucknow",
    "Bangalore",
    "Indore"
  ];

  final recentcitires = ["Mumbai", "Pune", "Bhopal"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading

    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.arrow_menu,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    // throw UnimplementedError();
    // return Container(
    //   width: 200,
    //   height: 200,
    //   child: Card(
    //     child: Center(
    //       child: Text(
    //         query,
    //         style: TextStyle(color: Colors.white),
    //       ),
    //     ),
    //     color: Colors.red,
    //   ),
    // );
    // return Navigator.push(context,MaterialPageRoute(builder: (context)=>jsonParse());

    // return name();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionlist = query.isEmpty
        ? recentcitires
        : cities.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
          print(query);
          // compoundsearch(query);
        },
        leading: Icon(Icons.location_city),
        title: Text(suggestionlist[index]),
      ),
      itemCount: suggestionlist.length,
    );
  }
}
