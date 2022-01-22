// To parse this JSON data, do
//
//     final therapistList = therapistListFromJson(jsonString);

import 'dart:convert';

TherapistList therapistListFromJson(String str) => TherapistList.fromJson(json.decode(str));

String therapistListToJson(TherapistList data) => json.encode(data.toJson());

class TherapistList {
  TherapistList({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Datum> data;

  factory TherapistList.fromJson(Map<String, dynamic> json) => TherapistList(
        status: json['status'],
        code: json['code'],
        data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'code': code,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.doctorId,
    required this.doctorName,
    required this.doctorType,
    required this.doctorAddress,
    required this.doctorPhoto,
    required this.doctorRatings,
  });

  String doctorId;
  String doctorName;
  String doctorType;
  String doctorAddress;
  String doctorPhoto;
  String doctorRatings;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        doctorId: json['doctorID'],
        doctorName: json['doctorName'],
        doctorType: json['doctorType'],
        doctorAddress: json['doctorAddress'],
        doctorPhoto: json['doctorPhoto'],
        doctorRatings: json['doctorRatings'],
      );

  Map<String, dynamic> toJson() => {
        'doctorID': doctorId,
        'doctorName': doctorName,
        'doctorType': doctorType,
        'doctorAddress': doctorAddress,
        'doctorPhoto': doctorPhoto,
        'doctorRatings': doctorRatings,
      };
}
