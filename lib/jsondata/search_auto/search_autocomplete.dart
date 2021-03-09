// To parse this JSON data, do
//
//     final autoComplete = autoCompleteFromJson(jsonString);

import 'dart:convert';

AutoComplete autoCompleteFromJson(String str) => AutoComplete.fromJson(json.decode(str));

String autoCompleteToJson(AutoComplete data) => json.encode(data.toJson());

class AutoComplete {
    AutoComplete({
        this.dictionaryTerms,
    });

    DictionaryTerms dictionaryTerms;

    factory AutoComplete.fromJson(Map<String, dynamic> json) => AutoComplete(
        dictionaryTerms: json["dictionary_terms"] == null ? null : DictionaryTerms.fromJson(json["dictionary_terms"]),
    );

    Map<String, dynamic> toJson() => {
        "dictionary_terms": dictionaryTerms == null ? null : dictionaryTerms.toJson(),
    };
}

class DictionaryTerms {
    DictionaryTerms({
        this.compound,
    });

    List<String> compound;

    factory DictionaryTerms.fromJson(Map<String, dynamic> json) => DictionaryTerms(
        compound: json["compound"] == null ? null : List<String>.from(json["compound"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "compound": compound == null ? null : List<dynamic>.from(compound.map((x) => x)),
    };
}
