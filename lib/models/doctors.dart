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
    required this.doctorEmail,
    required this.doctorPassword,
    required this.doctorPhone,
    required this.doctorDob,
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
  String doctorEmail;
  String doctorPassword;
  String doctorPhone;
  String doctorDob;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        doctorId: json['doctorID'].toString(),
        doctorName: json['doctorName'].toString(),
        doctorType: json['doctorType'].toString(),
        doctorAddress: json['doctorAddress'].toString(),
        description: json['description'].toString(),
        doctorExp: json['doctorExp'] ?? '0',
        totalPatients: json['totalPatients'] ?? '0',
        doctorPhoto: json['doctorPhoto'].toString(),
        doctorRatings: json['doctorRatings'] ?? '0',
        doctorEmail: json['doctorEmail'].toString(),
        doctorPassword: json['doctorPassword'].toString(),
        doctorPhone: json['doctorPhone'].toString(),
        doctorDob: json['doctorDOB'].toString(),
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
        'doctorEmail': doctorEmail,
        'doctorPassword': doctorPassword,
        'doctorPhone': doctorPhone,
        'doctorDOB': doctorDob,
      };
}
