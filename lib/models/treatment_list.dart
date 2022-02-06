// To parse this JSON data, do
//
//     final treatmentList = treatmentListFromJson(jsonString);

import 'dart:convert';

TreatmentList treatmentListFromJson(String str) => TreatmentList.fromJson(json.decode(str));

String treatmentListToJson(TreatmentList data) => json.encode(data.toJson());

class TreatmentList {
  TreatmentList({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Map<String, String>> data;

  factory TreatmentList.fromJson(Map<String, dynamic> json) => TreatmentList(
        status: json["status"],
        code: json["code"],
        data: List<Map<String, String>>.from(
            json["data"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v == null ? '' : v)))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(
            data.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
      };
}
