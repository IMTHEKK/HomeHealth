// To parse this JSON data, do
//
//     final treatmentDetails = treatmentDetailsFromJson(jsonString);

import 'dart:convert';

TreatmentDetails treatmentDetailsFromJson(String str) => TreatmentDetails.fromJson(json.decode(str));

String treatmentDetailsToJson(TreatmentDetails data) => json.encode(data.toJson());

class TreatmentDetails {
  TreatmentDetails({
    required this.treatmentStatus,
    required this.timeschedule,
    required this.status,
    required this.code,
    required this.data,
  });

  String treatmentStatus;
  String timeschedule;
  String status;
  int code;
  List<Datum> data;

  factory TreatmentDetails.fromJson(Map<String, dynamic> json) => TreatmentDetails(
        treatmentStatus: json["treatmentStatus"] ?? '',
        timeschedule: json["timeschedule"] ?? '',
        status: json["status"] ?? '',
        code: json["code"] ?? '',
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "treatmentStatus": treatmentStatus,
        "timeschedule": timeschedule,
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.bookingId,
    required this.patientName,
    required this.therapy,
    required this.gender,
    required this.age,
    required this.bookingTime,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.patientConcern,
    required this.doctorId,
    required this.customerId,
    required this.status,
  });

  String bookingId;
  String patientName;
  String therapy;
  String gender;
  String age;
  DateTime bookingTime;
  DateTime appointmentDate;
  String appointmentTime;
  String patientConcern;
  String doctorId;
  dynamic customerId;
  String status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        bookingId: json["booking_id"] ?? '',
        patientName: json["patient_name"] ?? '',
        therapy: json["therapy"] ?? '',
        gender: json["gender"] ?? '',
        age: json["age"] ?? '',
        bookingTime: DateTime.parse(json["bookingTime"]),
        appointmentDate: DateTime.parse(json["appointment_date"]),
        appointmentTime: json["appointment_time"] ?? '',
        patientConcern: json["patient_concern"] ?? '',
        doctorId: json["doctorID"] ?? '',
        customerId: json["customerID"] ?? '',
        status: json["status"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "patient_name": patientName,
        "therapy": therapy,
        "gender": gender,
        "age": age,
        "bookingTime": bookingTime.toIso8601String(),
        "appointment_date":
            "${appointmentDate.year.toString().padLeft(4, '0')}-${appointmentDate.month.toString().padLeft(2, '0')}-${appointmentDate.day.toString().padLeft(2, '0')}",
        "appointment_time": appointmentTime,
        "patient_concern": patientConcern,
        "doctorID": doctorId,
        "customerID": customerId,
        "status": status,
      };
}
