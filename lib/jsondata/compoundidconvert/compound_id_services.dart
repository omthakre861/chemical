import 'package:http/http.dart' as http;

class CompoundCIDServices {
  Future<String> getcompoundcid(String compoundName) async {
    var info;

    try {
      var url =
          "https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/name/$compoundName/cids/TXT";

      var req = await http.get(url);

      if (req.statusCode == 200) {
        info = req.body;
        print(info);
        return info;
      } else {
        final error = req.body;
        return error;
      }
    } on Exception catch (e) {
      // TODO
      print("Error caused $e");
      return info;
    }
  }
}
