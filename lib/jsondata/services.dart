import 'package:http/http.dart' as http;
import 'meltingpoint.dart';
// import 'user.dart';

class Services {
  static const String url =
      'https://pubchem.ncbi.nlm.nih.gov/rest/pug_view/data/compound/2244/JSON?heading=Melting+Point';
  // static const String url = 'http://jsonplaceholder.typicode.com/users';

  static Future<List<Info>> getInfo() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Info> info = infoFromJson(response.body);
        return info;
      } else {
        List<Info>();
      }
    } catch (e) {
      print(e);
    }
  }
}
