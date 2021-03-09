import 'package:http/http.dart' as http;
import 'search_autocomplete.dart';

class SearchAuto {
  Future<AutoComplete> getAutoComplete(String search) async {
    var url =
        'https://pubchem.ncbi.nlm.nih.gov/rest/autocomplete/compound/$search/json?limit=6';

    var req = await http.get(url);

    if (req.statusCode == 200) {
      final autoComplete = autoCompleteFromJson(req.body);
      return autoComplete;
    }else {
      final body = req.body;
      final error = autoCompleteFromJson(body);
      return error;
    }
  }
}
