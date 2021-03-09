import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:chemical/jsondata/meltingpoint.dart';

enum infoAction { Fetch }

class InfoBloc {
  final _stateStreamController = StreamController<Info>();
  StreamSink<Info> get _infoSink => _stateStreamController.sink;
  Stream<Info> get infoStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<infoAction>();
  StreamSink<infoAction> get eventSink => _eventStreamController.sink;
  Stream<infoAction> get _eventStream => _eventStreamController.stream;

  InfoBloc() {
    _eventStream.listen((event) async {
      if (event == infoAction.Fetch) {
        try {
          var info = await Servicess().getInfo();
          if (info != null)
            _infoSink.add(info);
          else
            _infoSink.addError("Something went Wrong");
        } on Exception catch (e) {
          _infoSink.addError("Something went Wrong");
          print("Error caused $e");
        }
      }
    });
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}

class Servicess {
  String compound;

  Servicess({this.compound});
  Future<Info> getInfo() async {
    var info;
    
    try {
      final url =
          'https://pubchem.ncbi.nlm.nih.gov/rest/pug_view/data/compound/$compound/JSON?heading=Melting+Point';
      print(compound);
      final req = await http.get(url);

      if (req.statusCode == 200) {
        info = infoFromJson(req.body);
        print(req.statusCode);
        print(req.body);
        return info;
      } else {
        // final body = req.body;
        // print(body);
        // print(req.statusCode);
        // final error = infoFromJson(body);
        // return error;
      }
    } on Exception catch (e) {
      print("Error caused $e");
      return info;
    }
  }
}
