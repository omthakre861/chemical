// To parse this JSON data, do
//
//     final infoData = infoDataFromJson(jsonString);

import 'dart:convert';

InfoData infoDataFromJson(String str) => InfoData.fromJson(json.decode(str));

String infoDataToJson(InfoData data) => json.encode(data.toJson());

class InfoData {
    InfoData({
        this.record,
    });

    final Record record;

    factory InfoData.fromJson(Map<String, dynamic> json) => InfoData(
        record: json["Record"] == null ? null : Record.fromJson(json["Record"]),
    );

    Map<String, dynamic> toJson() => {
        "Record": record == null ? null : record.toJson(),
    };
}

class Record {
    Record({
        this.recordType,
        this.recordNumber,
        this.recordTitle,
        this.section,
    });

    final String recordType;
    final int recordNumber;
    final String recordTitle;
    final List<RecordSection> section;

    factory Record.fromJson(Map<String, dynamic> json) => Record(
        recordType: json["RecordType"] == null ? null : json["RecordType"],
        recordNumber: json["RecordNumber"] == null ? null : json["RecordNumber"],
        recordTitle: json["RecordTitle"] == null ? null : json["RecordTitle"],
        section: json["Section"] == null ? null : List<RecordSection>.from(json["Section"].map((x) => RecordSection.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "RecordType": recordType == null ? null : recordType,
        "RecordNumber": recordNumber == null ? null : recordNumber,
        "RecordTitle": recordTitle == null ? null : recordTitle,
        "Section": section == null ? null : List<dynamic>.from(section.map((x) => x.toJson())),
    };
}

class RecordSection {
    RecordSection({
        this.tocHeading,
        this.description,
        this.section,
        this.displayControls,
        this.information,
    });

    final String tocHeading;
    final String description;
    final List<PurpleSection> section;
    final PurpleDisplayControls displayControls;
    final List<PurpleInformation> information;

    factory RecordSection.fromJson(Map<String, dynamic> json) => RecordSection(
        tocHeading: json["TOCHeading"] == null ? null : json["TOCHeading"],
        description: json["Description"] == null ? null : json["Description"],
        section: json["Section"] == null ? null : List<PurpleSection>.from(json["Section"].map((x) => PurpleSection.fromJson(x))),
        displayControls: json["DisplayControls"] == null ? null : PurpleDisplayControls.fromJson(json["DisplayControls"]),
        information: json["Information"] == null ? null : List<PurpleInformation>.from(json["Information"].map((x) => PurpleInformation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "TOCHeading": tocHeading == null ? null : tocHeading,
        "Description": description == null ? null : description,
        "Section": section == null ? null : List<dynamic>.from(section.map((x) => x.toJson())),
        "DisplayControls": displayControls == null ? null : displayControls.toJson(),
        "Information": information == null ? null : List<dynamic>.from(information.map((x) => x.toJson())),
    };
}

class PurpleDisplayControls {
    PurpleDisplayControls({
        this.hideThisSection,
        this.moveToTop,
    });

    final bool hideThisSection;
    final bool moveToTop;

    factory PurpleDisplayControls.fromJson(Map<String, dynamic> json) => PurpleDisplayControls(
        hideThisSection: json["HideThisSection"] == null ? null : json["HideThisSection"],
        moveToTop: json["MoveToTop"] == null ? null : json["MoveToTop"],
    );

    Map<String, dynamic> toJson() => {
        "HideThisSection": hideThisSection == null ? null : hideThisSection,
        "MoveToTop": moveToTop == null ? null : moveToTop,
    };
}

class PurpleInformation {
    PurpleInformation({
        this.name,
        this.value,
    });

    final String name;
    final PurpleValue value;

    factory PurpleInformation.fromJson(Map<String, dynamic> json) => PurpleInformation(
        name: json["Name"] == null ? null : json["Name"],
        value: json["Value"] == null ? null : PurpleValue.fromJson(json["Value"]),
    );

    Map<String, dynamic> toJson() => {
        "Name": name == null ? null : name,
        "Value": value == null ? null : value.toJson(),
    };
}

class PurpleValue {
    PurpleValue({
        this.stringWithMarkup,
    });

    final List<PurpleStringWithMarkup> stringWithMarkup;

    factory PurpleValue.fromJson(Map<String, dynamic> json) => PurpleValue(
        stringWithMarkup: json["StringWithMarkup"] == null ? null : List<PurpleStringWithMarkup>.from(json["StringWithMarkup"].map((x) => PurpleStringWithMarkup.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "StringWithMarkup": stringWithMarkup == null ? null : List<dynamic>.from(stringWithMarkup.map((x) => x.toJson())),
    };
}

class PurpleStringWithMarkup {
    PurpleStringWithMarkup({
        this.string,
        this.markup,
    });

    final String string;
    final List<PurpleMarkup> markup;

    factory PurpleStringWithMarkup.fromJson(Map<String, dynamic> json) => PurpleStringWithMarkup(
        string: json["String"] == null ? null : json["String"],
        markup: json["Markup"] == null ? null : List<PurpleMarkup>.from(json["Markup"].map((x) => PurpleMarkup.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "String": string == null ? null : string,
        "Markup": markup == null ? null : List<dynamic>.from(markup.map((x) => x.toJson())),
    };
}

class PurpleMarkup {
    PurpleMarkup({
        this.start,
        this.length,
        this.url,
        this.type,
        this.extra,
    });

    final int start;
    final int length;
    final String url;
    final String type;
    final String extra;

    factory PurpleMarkup.fromJson(Map<String, dynamic> json) => PurpleMarkup(
        start: json["Start"] == null ? null : json["Start"],
        length: json["Length"] == null ? null : json["Length"],
        url: json["URL"] == null ? null : json["URL"],
        type: json["Type"] == null ? null : json["Type"],
        extra: json["Extra"] == null ? null : json["Extra"],
    );

    Map<String, dynamic> toJson() => {
        "Start": start == null ? null : start,
        "Length": length == null ? null : length,
        "URL": url == null ? null : url,
        "Type": type == null ? null : type,
        "Extra": extra == null ? null : extra,
    };
}

class PurpleSection {
    PurpleSection({
        this.tocHeading,
        this.description,
        this.information,
        this.section,
    });

    final String tocHeading;
    final String description;
    final List<FluffyInformation> information;
    final List<FluffySection> section;

    factory PurpleSection.fromJson(Map<String, dynamic> json) => PurpleSection(
        tocHeading: json["TOCHeading"] == null ? null : json["TOCHeading"],
        description: json["Description"] == null ? null : json["Description"],
        information: json["Information"] == null ? null : List<FluffyInformation>.from(json["Information"].map((x) => FluffyInformation.fromJson(x))),
        section: json["Section"] == null ? null : List<FluffySection>.from(json["Section"].map((x) => FluffySection.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "TOCHeading": tocHeading == null ? null : tocHeading,
        "Description": description == null ? null : description,
        "Information": information == null ? null : List<dynamic>.from(information.map((x) => x.toJson())),
        "Section": section == null ? null : List<dynamic>.from(section.map((x) => x.toJson())),
    };
}

class FluffyInformation {
    FluffyInformation({
        this.value,
        this.name,
    });

    final FluffyValue value;
    final String name;

    factory FluffyInformation.fromJson(Map<String, dynamic> json) => FluffyInformation(
        value: json["Value"] == null ? null : FluffyValue.fromJson(json["Value"]),
        name: json["Name"] == null ? null : json["Name"],
    );

    Map<String, dynamic> toJson() => {
        "Value": value == null ? null : value.toJson(),
        "Name": name == null ? null : name,
    };
}

class FluffyValue {
    FluffyValue({
        this.boolean,
        this.stringWithMarkup,
    });

    final List<bool> boolean;
    final List<FluffyStringWithMarkup> stringWithMarkup;

    factory FluffyValue.fromJson(Map<String, dynamic> json) => FluffyValue(
        boolean: json["Boolean"] == null ? null : List<bool>.from(json["Boolean"].map((x) => x)),
        stringWithMarkup: json["StringWithMarkup"] == null ? null : List<FluffyStringWithMarkup>.from(json["StringWithMarkup"].map((x) => FluffyStringWithMarkup.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Boolean": boolean == null ? null : List<dynamic>.from(boolean.map((x) => x)),
        "StringWithMarkup": stringWithMarkup == null ? null : List<dynamic>.from(stringWithMarkup.map((x) => x.toJson())),
    };
}

class FluffyStringWithMarkup {
    FluffyStringWithMarkup({
        this.string,
    });

    final String string;

    factory FluffyStringWithMarkup.fromJson(Map<String, dynamic> json) => FluffyStringWithMarkup(
        string: json["String"] == null ? null : json["String"],
    );

    Map<String, dynamic> toJson() => {
        "String": string == null ? null : string,
    };
}

class FluffySection {
    FluffySection({
        this.tocHeading,
        this.description,
        this.information,
        this.displayControls,
    });

    final String tocHeading;
    final String description;
    final List<TentacledInformation> information;
    final FluffyDisplayControls displayControls;

    factory FluffySection.fromJson(Map<String, dynamic> json) => FluffySection(
        tocHeading: json["TOCHeading"] == null ? null : json["TOCHeading"],
        description: json["Description"] == null ? null : json["Description"],
        information: json["Information"] == null ? null : List<TentacledInformation>.from(json["Information"].map((x) => TentacledInformation.fromJson(x))),
        displayControls: json["DisplayControls"] == null ? null : FluffyDisplayControls.fromJson(json["DisplayControls"]),
    );

    Map<String, dynamic> toJson() => {
        "TOCHeading": tocHeading == null ? null : tocHeading,
        "Description": description == null ? null : description,
        "Information": information == null ? null : List<dynamic>.from(information.map((x) => x.toJson())),
        "DisplayControls": displayControls == null ? null : displayControls.toJson(),
    };
}

class FluffyDisplayControls {
    FluffyDisplayControls({
        this.listType,
    });

    final String listType;

    factory FluffyDisplayControls.fromJson(Map<String, dynamic> json) => FluffyDisplayControls(
        listType: json["ListType"] == null ? null : json["ListType"],
    );

    Map<String, dynamic> toJson() => {
        "ListType": listType == null ? null : listType,
    };
}

class TentacledInformation {
    TentacledInformation({
        this.value,
    });

    final TentacledValue value;

    factory TentacledInformation.fromJson(Map<String, dynamic> json) => TentacledInformation(
        value: json["Value"] == null ? null : TentacledValue.fromJson(json["Value"]),
    );

    Map<String, dynamic> toJson() => {
        "Value": value == null ? null : value.toJson(),
    };
}

class TentacledValue {
    TentacledValue({
        this.stringWithMarkup,
        this.externalDataUrl,
        this.mimeType,
        this.number,
        this.unit,
    });

    final List<TentacledStringWithMarkup> stringWithMarkup;
    final List<String> externalDataUrl;
    final String mimeType;
    final List<double> number;
    final String unit;

    factory TentacledValue.fromJson(Map<String, dynamic> json) => TentacledValue(
        stringWithMarkup: json["StringWithMarkup"] == null ? null : List<TentacledStringWithMarkup>.from(json["StringWithMarkup"].map((x) => TentacledStringWithMarkup.fromJson(x))),
        externalDataUrl: json["ExternalDataURL"] == null ? null : List<String>.from(json["ExternalDataURL"].map((x) => x)),
        mimeType: json["MimeType"] == null ? null : json["MimeType"],
        number: json["Number"] == null ? null : List<double>.from(json["Number"].map((x) => x.toDouble())),
        unit: json["Unit"] == null ? null : json["Unit"],
    );

    Map<String, dynamic> toJson() => {
        "StringWithMarkup": stringWithMarkup == null ? null : List<dynamic>.from(stringWithMarkup.map((x) => x.toJson())),
        "ExternalDataURL": externalDataUrl == null ? null : List<dynamic>.from(externalDataUrl.map((x) => x)),
        "MimeType": mimeType == null ? null : mimeType,
        "Number": number == null ? null : List<dynamic>.from(number.map((x) => x)),
        "Unit": unit == null ? null : unit,
    };
}

class TentacledStringWithMarkup {
    TentacledStringWithMarkup({
        this.string,
        this.markup,
    });

    final String string;
    final List<FluffyMarkup> markup;

    factory TentacledStringWithMarkup.fromJson(Map<String, dynamic> json) => TentacledStringWithMarkup(
        string: json["String"] == null ? null : json["String"],
        markup: json["Markup"] == null ? null : List<FluffyMarkup>.from(json["Markup"].map((x) => FluffyMarkup.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "String": string == null ? null : string,
        "Markup": markup == null ? null : List<dynamic>.from(markup.map((x) => x.toJson())),
    };
}

class FluffyMarkup {
    FluffyMarkup({
        this.start,
        this.length,
        this.type,
    });

    final int start;
    final int length;
    final String type;

    factory FluffyMarkup.fromJson(Map<String, dynamic> json) => FluffyMarkup(
        start: json["Start"] == null ? null : json["Start"],
        length: json["Length"] == null ? null : json["Length"],
        type: json["Type"] == null ? null : json["Type"],
    );

    Map<String, dynamic> toJson() => {
        "Start": start == null ? null : start,
        "Length": length == null ? null : length,
        "Type": type == null ? null : type,
    };
}
