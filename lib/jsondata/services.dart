import 'package:http/http.dart' as http;
import 'info_data.dart';
// import 'meltingpoint.dart';
// import 'user.dart';

class InfoRepo {
  Future<InfoData> getInfo(String compound_id) async {
    final url =
        'https://pubchem.ncbi.nlm.nih.gov/rest/pug_view/data/compound/$compound_id/JSON';

    final req = await http.get(url);
    
    if (req.statusCode == 200) {
      var info = infoDataFromJson(req.body);
      
      return info;
    } else {
      final body = req.body;
      final error = infoDataFromJson(body);
      
      return error;
    }
  }
}
