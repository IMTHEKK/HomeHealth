// To parse this JSON data, do
//
//     final treatmentList = treatmentListFromJson(jsonString);

import 'dart:convert';

TreatmentList1 treatmentList1FromJson(String str) => TreatmentList1.fromJson(json.decode(str));

String treatmentListToJson(TreatmentList1 data) => json.encode(data.toJson());

class TreatmentList1 {
  TreatmentList1({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Datum> data;

  factory TreatmentList1.fromJson(Map<String, dynamic> json) => TreatmentList1(
        status: json["status"],
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.bookingId,
    required this.customerId,
    required this.doctorId,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.address,
    required this.phone,
    required this.email,
    required this.familyDoctor,
    required this.medicalConditions,
    required this.injuredArea,
    required this.xray,
    required this.medications,
    required this.emergencyContactName,
    required this.emergencyContactRelation,
    required this.emergencyContactNumber,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.status,
    required this.bookingTime,
  });

  String bookingId;
  String customerId;
  String doctorId;
  String firstName;
  String lastName;
  String dob;
  String address;
  String phone;
  String email;
  String familyDoctor;
  String medicalConditions;
  String injuredArea;
  String xray;
  String medications;
  String emergencyContactName;
  String emergencyContactRelation;
  String emergencyContactNumber;
  String appointmentDate;
  String appointmentTime;
  String status;
  String bookingTime;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        bookingId: json["booking_id"] ?? '',
        customerId: json["customerID"] ?? '',
        doctorId: json["doctorID"] ?? '',
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        dob: json["dob"] ?? '',
        address: json["address"] ?? '',
        phone: json["phone"] ?? '',
        email: json["email"] ?? '',
        familyDoctor: json["family_doctor"] ?? '',
        medicalConditions: json["medical_conditions"] ?? '',
        injuredArea: json["injured_area"] ?? '',
        xray: json["xray"] ?? '',
        medications: json["medications"] ?? '',
        emergencyContactName: json["emergency_contact_name"] ?? '',
        emergencyContactRelation: json["emergency_contact_relation"] ?? '',
        emergencyContactNumber: json["emergency_contact_number"] ?? '',
        appointmentDate: json["appointment_date"] ?? '',
        appointmentTime: json["appointment_time"] ?? '',
        status: json["status"] ?? '',
        bookingTime: json["bookingTime"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "customerID": customerId,
        "doctorID": doctorId,
        "first_name": firstName,
        "last_name": lastName,
        "dob": dob,
        "address": address,
        "phone": phone,
        "email": email,
        "family_doctor": familyDoctor,
        "medical_conditions": medicalConditions,
        "injured_area": injuredArea,
        "xray": xray,
        "medications": medications,
        "emergency_contact_name": emergencyContactName,
        "emergency_contact_relation": emergencyContactRelation,
        "emergency_contact_number": emergencyContactNumber,
        "appointment_date": appointmentDate,
        "appointment_time": appointmentTime,
        "status": status,
        "bookingTime": bookingTime,
      };
}
