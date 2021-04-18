import 'package:chemical/data/compoundData/services_compound.dart';
import 'package:chemical/data/model/info.dart';

class Respository_compound {
  final Services_compound services_compound;

  final compound_id;

  Respository_compound({this.services_compound,this.compound_id});

  Future<List<Info>> fetchinfo(compound_id) {
    services_compound.fetchinfo(compound_id);
  }
}
