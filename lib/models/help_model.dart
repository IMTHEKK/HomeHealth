// To parse this JSON data, do
//
//     final helpModel = helpModelFromJson(jsonString);

import 'dart:convert';

HelpModel helpModelFromJson(String str) => HelpModel.fromJson(json.decode(str));

String helpModelToJson(HelpModel data) => json.encode(data.toJson());

class HelpModel {
  HelpModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  String status;
  int code;
  String message;
  Data data;

  factory HelpModel.fromJson(Map<String, dynamic> json) => HelpModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.support,
    required this.faq,
  });

  Support support;
  List<Faq> faq;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        support: Support.fromJson(json["support"]),
        faq: List<Faq>.from(json["faq"].map((x) => Faq.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "support": support.toJson(),
        "faq": List<dynamic>.from(faq.map((x) => x.toJson())),
      };
}

class Faq {
  Faq({
    required this.id,
    required this.question,
    required this.answer,
    required this.priority,
    required this.status,
  });

  String id;
  String question;
  String answer;
  String priority;
  String status;

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
        priority: json["priority"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
        "priority": priority,
        "status": status,
      };
}

class Support {
  Support({
    required this.contactNumber,
    required this.email,
    required this.address,
  });

  String contactNumber;
  String email;
  String address;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        contactNumber: json["contactNumber"],
        email: json["email"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "contactNumber": contactNumber,
        "email": email,
        "address": address,
      };
}
