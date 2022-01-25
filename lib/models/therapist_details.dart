// To parse this JSON data, do
//
//     final therapistDetails = therapistDetailsFromJson(jsonString);

import 'dart:convert';

TherapistDetails therapistDetailsFromJson(String str) =>
    TherapistDetails.fromJson(json.decode(str));

String therapistDetailsToJson(TherapistDetails data) => json.encode(data.toJson());

class TherapistDetails {
  TherapistDetails({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Datum> data;

  factory TherapistDetails.fromJson(Map<String, dynamic> json) => TherapistDetails(
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
        doctorId: json['doctorID'] ?? '',
        doctorName: json['doctorName'] ?? '',
        doctorType: json['doctorType'] ?? '',
        doctorAddress: json['doctorAddress'] ?? '',
        description: json['description'] ?? '',
        doctorExp: json['doctorExp'] ?? '',
        totalPatients: json['totalPatients'] ?? '',
        doctorPhoto: json['doctorPhoto'] ?? '',
        doctorRatings: json['doctorRatings'] ?? '',
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
