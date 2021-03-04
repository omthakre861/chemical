// To parse this JSON data, do
//
//     final info = infoFromJson(jsonString);

import 'dart:convert';

List<Info> infoFromJson(String str) => List<Info>.from(json.decode(str).map((x) => Info.fromJson(x)));

String infoToJson(List<Info> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Info {
    Info({
        this.record,
    });

    Record record;

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        record: Record.fromJson(json["Record"]),
    );

    Map<String, dynamic> toJson() => {
        "Record": record.toJson(),
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
        recordType: json["RecordType"],
        recordNumber: json["RecordNumber"],
        recordTitle: json["RecordTitle"],
        section: List<RecordSection>.from(json["Section"].map((x) => RecordSection.fromJson(x))),
        reference: List<Reference>.from(json["Reference"].map((x) => Reference.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "RecordType": recordType,
        "RecordNumber": recordNumber,
        "RecordTitle": recordTitle,
        "Section": List<dynamic>.from(section.map((x) => x.toJson())),
        "Reference": List<dynamic>.from(reference.map((x) => x.toJson())),
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
        referenceNumber: json["ReferenceNumber"],
        sourceName: json["SourceName"],
        sourceId: json["SourceID"],
        name: json["Name"],
        description: json["Description"],
        url: json["URL"],
        licenseNote: json["LicenseNote"] == null ? null : json["LicenseNote"],
        licenseUrl: json["LicenseURL"] == null ? null : json["LicenseURL"],
        anid: json["ANID"],
        isToxnet: json["IsToxnet"] == null ? null : json["IsToxnet"],
    );

    Map<String, dynamic> toJson() => {
        "ReferenceNumber": referenceNumber,
        "SourceName": sourceName,
        "SourceID": sourceId,
        "Name": name,
        "Description": description,
        "URL": url,
        "LicenseNote": licenseNote == null ? null : licenseNote,
        "LicenseURL": licenseUrl == null ? null : licenseUrl,
        "ANID": anid,
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
        tocHeading: json["TOCHeading"],
        description: json["Description"],
        section: List<PurpleSection>.from(json["Section"].map((x) => PurpleSection.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "TOCHeading": tocHeading,
        "Description": description,
        "Section": List<dynamic>.from(section.map((x) => x.toJson())),
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
        tocHeading: json["TOCHeading"],
        description: json["Description"],
        section: List<FluffySection>.from(json["Section"].map((x) => FluffySection.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "TOCHeading": tocHeading,
        "Description": description,
        "Section": List<dynamic>.from(section.map((x) => x.toJson())),
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
        tocHeading: json["TOCHeading"],
        description: json["Description"],
        information: List<Information>.from(json["Information"].map((x) => Information.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "TOCHeading": tocHeading,
        "Description": description,
        "Information": List<dynamic>.from(information.map((x) => x.toJson())),
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
        referenceNumber: json["ReferenceNumber"],
        reference: json["Reference"] == null ? null : List<String>.from(json["Reference"].map((x) => x)),
        value: Value.fromJson(json["Value"]),
        description: json["Description"] == null ? null : json["Description"],
    );

    Map<String, dynamic> toJson() => {
        "ReferenceNumber": referenceNumber,
        "Reference": reference == null ? null : List<dynamic>.from(reference.map((x) => x)),
        "Value": value.toJson(),
        "Description": description == null ? null : description,
    };
}

class Value {
    Value({
        this.stringWithMarkup,
    });

    List<StringWithMarkup> stringWithMarkup;

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        stringWithMarkup: List<StringWithMarkup>.from(json["StringWithMarkup"].map((x) => StringWithMarkup.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "StringWithMarkup": List<dynamic>.from(stringWithMarkup.map((x) => x.toJson())),
    };
}

class StringWithMarkup {
    StringWithMarkup({
        this.string,
    });

    String string;

    factory StringWithMarkup.fromJson(Map<String, dynamic> json) => StringWithMarkup(
        string: json["String"],
    );

    Map<String, dynamic> toJson() => {
        "String": string,
    };
}
