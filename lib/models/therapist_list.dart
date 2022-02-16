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

  late String status;
  late int code;
  late List<Datum> data;

  factory TherapistList.fromJson(Map<String, dynamic> json) =>
      TherapistList(
        status: json['status'],
        code: json['code'],
        data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
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
    required this.doctorExp,
    required this.totalPatients,
  });

  String doctorId;
  String doctorName;
  String doctorType;
  String doctorAddress;
  String doctorPhoto;
  String doctorRatings;
  String doctorExp;
  String totalPatients;

  factory Datum.fromJson(Map<String, dynamic> json) =>
      Datum(
        doctorId: json['doctorID'] ?? '',
        doctorName: json['doctorName'] ?? '',
        doctorType: json['doctorType'] ?? '',
        doctorAddress: json['doctorAddress'] ?? '',
        doctorPhoto: json['doctorPhoto'] ?? '',
        doctorRatings: json['doctorRatings']??'0',
        doctorExp: json['doctorExp']??'0',
        totalPatients: json['totalPatients']??'0',
      );

  Map<String, dynamic> toJson() =>
      {
        'doctorID': doctorId,
        'doctorName': doctorName,
        'doctorType': doctorType,
        'doctorAddress': doctorAddress,
        'doctorPhoto': doctorPhoto,
        'doctorRatings': doctorRatings,
        'doctorExp': doctorExp,
        'totalPatients': totalPatients,
      };
}
