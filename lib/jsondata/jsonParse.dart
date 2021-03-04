import 'package:flutter/material.dart';
import "services.dart";
import 'meltingpoint.dart';
// import 'user.dart';

class jsonParse extends StatefulWidget {
  @override
  _jsonParseState createState() => _jsonParseState();
}

class _jsonParseState extends State<jsonParse> {
  List<Info> _info;
  bool _loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;
    Services.getInfo().then((info) {
      setState(() {
        _info = info;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? "loading" : "Info"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: _info == null ? 0 : _info.length,
            itemBuilder: (context, index) {
              Info info = _info[index];
              print(_info);
              return ListTile(
                title: Text(info.record.recordTitle),
                subtitle: Text("Boi"),
              );
            }),
      ),
    );
  }
}
