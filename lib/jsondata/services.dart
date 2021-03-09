import 'package:http/http.dart' as http;
import 'meltingpoint.dart';
// import 'user.dart';


class InfoRepo {
  Future<Info> getInfo(String compound_id) async {
    final url =
        'https://pubchem.ncbi.nlm.nih.gov/rest/pug_view/data/compound/$compound_id/JSON?heading=Melting+Point';
    final req = await http.get(url);
    if (req.statusCode == 200) {
      var info = infoFromJson(req.body);

      return info;
    } else {
      final body = req.body;
      final error = infoFromJson(body);
      return error;
    }
  }
}
