// To parse this JSON data, do
//
//     final doctor = doctorFromJson(jsonString);

import 'dart:convert';

Doctor doctorFromJson(String str) => Doctor.fromJson(json.decode(str));

String doctorToJson(Doctor data) => json.encode(data.toJson());

class Doctor {
  Doctor({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Datum> data;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
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
    required this.description,
    required this.doctorExp,
    required this.totalPatients,
    required this.doctorPhoto,
    required this.doctorRatings,
  });

  String doctorId;
  String doctorName;
  String doctorType;
  String doctorAddress;
  String description;
  String doctorExp;
  String totalPatients;
  String doctorPhoto;
  String doctorRatings;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        doctorId: json['doctorID'],
        doctorName: json['doctorName'],
        doctorType: json['doctorType'],
        doctorAddress: json['doctorAddress'],
        description: json['description'],
        doctorExp: json['doctorExp'],
        totalPatients: json['totalPatients'],
        doctorPhoto: json['doctorPhoto'],
        doctorRatings: json['doctorRatings'],
      );

  Map<String, dynamic> toJson() => {
        'doctorID': doctorId,
        'doctorName': doctorName,
        'doctorType': doctorType,
        'doctorAddress': doctorAddress,
        'description': description,
        'doctorExp': doctorExp,
        'totalPatients': totalPatients,
        'doctorPhoto': doctorPhoto,
        'doctorRatings': doctorRatings,
      };
}
