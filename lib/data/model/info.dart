// To parse this JSON data, do
//
//     final info = infoFromJson(jsonString);

import 'dart:convert';

Info infoFromJson(String str) => Info.fromJson(json.decode(str));

String infoToJson(Info data) => json.encode(data.toJson());

class Info {
    Info({
        this.record,
    });

    Record record;

    factory Info.fromJson(Map<String, dynamic> json) => Info(
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
        this.reference,
    });

    String recordType;
    int recordNumber;
    String recordTitle;
    List<RecordSection> section;
    List<Reference> reference;

    factory Record.fromJson(Map<String, dynamic> json) => Record(
        recordType: json["RecordType"] == null ? null : json["RecordType"],
        recordNumber: json["RecordNumber"] == null ? null : json["RecordNumber"],
        recordTitle: json["RecordTitle"] == null ? null : json["RecordTitle"],
        section: json["Section"] == null ? null : List<RecordSection>.from(json["Section"].map((x) => RecordSection.fromJson(x))),
        reference: json["Reference"] == null ? null : List<Reference>.from(json["Reference"].map((x) => Reference.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "RecordType": recordType == null ? null : recordType,
        "RecordNumber": recordNumber == null ? null : recordNumber,
        "RecordTitle": recordTitle == null ? null : recordTitle,
        "Section": section == null ? null : List<dynamic>.from(section.map((x) => x.toJson())),
        "Reference": reference == null ? null : List<dynamic>.from(reference.map((x) => x.toJson())),
    };
}

class Reference {
    Reference({
        this.referenceNumber,
        this.sourceName,
        this.sourceId,
        this.name,
        this.description,
        this.url,
        this.licenseNote,
        this.licenseUrl,
        this.anid,
        this.isToxnet,
    });

    int referenceNumber;
    String sourceName;
    String sourceId;
    String name;
    String description;
    String url;
    String licenseNote;
    String licenseUrl;
    int anid;
    bool isToxnet;

    factory Reference.fromJson(Map<String, dynamic> json) => Reference(
        referenceNumber: json["ReferenceNumber"] == null ? null : json["ReferenceNumber"],
        sourceName: json["SourceName"] == null ? null : json["SourceName"],
        sourceId: json["SourceID"] == null ? null : json["SourceID"],
        name: json["Name"] == null ? null : json["Name"],
        description: json["Description"] == null ? null : json["Description"],
        url: json["URL"] == null ? null : json["URL"],
        licenseNote: json["LicenseNote"] == null ? null : json["LicenseNote"],
        licenseUrl: json["LicenseURL"] == null ? null : json["LicenseURL"],
        anid: json["ANID"] == null ? null : json["ANID"],
        isToxnet: json["IsToxnet"] == null ? null : json["IsToxnet"],
    );

    Map<String, dynamic> toJson() => {
        "ReferenceNumber": referenceNumber == null ? null : referenceNumber,
        "SourceName": sourceName == null ? null : sourceName,
        "SourceID": sourceId == null ? null : sourceId,
        "Name": name == null ? null : name,
        "Description": description == null ? null : description,
        "URL": url == null ? null : url,
        "LicenseNote": licenseNote == null ? null : licenseNote,
        "LicenseURL": licenseUrl == null ? null : licenseUrl,
        "ANID": anid == null ? null : anid,
        "IsToxnet": isToxnet == null ? null : isToxnet,
    };
}

class RecordSection {
    RecordSection({
        this.tocHeading,
        this.description,
        this.section,
    });

    String tocHeading;
    String description;
    List<PurpleSection> section;

    factory RecordSection.fromJson(Map<String, dynamic> json) => RecordSection(
        tocHeading: json["TOCHeading"] == null ? null : json["TOCHeading"],
        description: json["Description"] == null ? null : json["Description"],
        section: json["Section"] == null ? null : List<PurpleSection>.from(json["Section"].map((x) => PurpleSection.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "TOCHeading": tocHeading == null ? null : tocHeading,
        "Description": description == null ? null : description,
        "Section": section == null ? null : List<dynamic>.from(section.map((x) => x.toJson())),
    };
}

class PurpleSection {
    PurpleSection({
        this.tocHeading,
        this.description,
        this.section,
    });

    String tocHeading;
    String description;
    List<FluffySection> section;

    factory PurpleSection.fromJson(Map<String, dynamic> json) => PurpleSection(
        tocHeading: json["TOCHeading"] == null ? null : json["TOCHeading"],
        description: json["Description"] == null ? null : json["Description"],
        section: json["Section"] == null ? null : List<FluffySection>.from(json["Section"].map((x) => FluffySection.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "TOCHeading": tocHeading == null ? null : tocHeading,
        "Description": description == null ? null : description,
        "Section": section == null ? null : List<dynamic>.from(section.map((x) => x.toJson())),
    };
}

class FluffySection {
    FluffySection({
        this.tocHeading,
        this.description,
        this.information,
    });

    String tocHeading;
    String description;
    List<Information> information;

    factory FluffySection.fromJson(Map<String, dynamic> json) => FluffySection(
        tocHeading: json["TOCHeading"] == null ? null : json["TOCHeading"],
        description: json["Description"] == null ? null : json["Description"],
        information: json["Information"] == null ? null : List<Information>.from(json["Information"].map((x) => Information.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "TOCHeading": tocHeading == null ? null : tocHeading,
        "Description": description == null ? null : description,
        "Information": information == null ? null : List<dynamic>.from(information.map((x) => x.toJson())),
    };
}

class Information {
    Information({
        this.referenceNumber,
        this.reference,
        this.value,
        this.description,
    });

    int referenceNumber;
    List<String> reference;
    Value value;
    String description;

    factory Information.fromJson(Map<String, dynamic> json) => Information(
        referenceNumber: json["ReferenceNumber"] == null ? null : json["ReferenceNumber"],
        reference: json["Reference"] == null ? null : List<String>.from(json["Reference"].map((x) => x)),
        value: json["Value"] == null ? null : Value.fromJson(json["Value"]),
        description: json["Description"] == null ? null : json["Description"],
    );

    Map<String, dynamic> toJson() => {
        "ReferenceNumber": referenceNumber == null ? null : referenceNumber,
        "Reference": reference == null ? null : List<dynamic>.from(reference.map((x) => x)),
        "Value": value == null ? null : value.toJson(),
        "Description": description == null ? null : description,
    };
}

class Value {
    Value({
        this.stringWithMarkup,
    });

    List<StringWithMarkup> stringWithMarkup;

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        stringWithMarkup: json["StringWithMarkup"] == null ? null : List<StringWithMarkup>.from(json["StringWithMarkup"].map((x) => StringWithMarkup.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "StringWithMarkup": stringWithMarkup == null ? null : List<dynamic>.from(stringWithMarkup.map((x) => x.toJson())),
    };
}

class StringWithMarkup {
    StringWithMarkup({
        this.string,
    });

    String string;

    factory StringWithMarkup.fromJson(Map<String, dynamic> json) => StringWithMarkup(
        string: json["String"] == null ? null : json["String"],
    );

    Map<String, dynamic> toJson() => {
        "String": string == null ? null : string,
    };
}
