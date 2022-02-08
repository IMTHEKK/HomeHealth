// To parse this JSON data, do
//
//     final testimonials = testimonialsFromJson(jsonString);

import 'dart:convert';

Testimonials testimonialsFromJson(String str) =>
    Testimonials.fromJson(json.decode(str));

String testimonialsToJson(Testimonials data) => json.encode(data.toJson());

class Testimonials {
  Testimonials({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  String status;
  int code;
  String message;
  List<Datum> data;

  factory Testimonials.fromJson(Map<String, dynamic> json) => Testimonials(
        status: json['status'],
        code: json['code'],
        message: json['message'],
        data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'code': code,
        'message': message,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.customerId,
    required this.name,
    required this.doctorId,
    required this.appointmentId,
    required this.ratings,
    required this.comments,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  String id;
  String customerId;
  String name;
  String doctorId;
  String appointmentId;
  String ratings;
  String comments;
  String status;
  String createdAt;
  String updatedAt;
  String deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['ID'] ?? '',
        customerId: json['customerID'] ?? '',
        name: json['name'] ?? '',
        doctorId: json['doctorID'] ?? '',
        appointmentId: json['appointmentID'] ?? '',
        ratings: json['ratings'] ?? '',
        comments: json['comments'] ?? '',
        status: json['status'] ?? '',
        createdAt: json['createdAt'] ?? '',
        updatedAt: json['updatedAt'] == null ? '' : json['updatedAt'],
        deletedAt: json['deletedAt'] == null ? '' : json['deletedAt'],
      );

  Map<String, dynamic> toJson() => {
        'ID': id,
        'customerID': customerId,
        'name': name,
        'doctor_id': doctorId,
        'appointment_id': appointmentId,
        'ratings': ratings,
        'comments': comments,
        'status': status,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt,
      };
}
