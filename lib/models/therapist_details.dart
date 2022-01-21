// To parse this JSON data, do
//
//     final therapistDetails = therapistDetailsFromJson(jsonString);

import 'dart:convert';

TherapistDetails therapistDetailsFromJson(String str) => TherapistDetails.fromJson(json.decode(str));

String therapistDetailsToJson(TherapistDetails data) => json.encode(data.toJson());

class TherapistDetails {
  TherapistDetails({
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

  factory TherapistDetails.fromJson(Map<String, dynamic> json) => TherapistDetails(
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
