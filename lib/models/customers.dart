// To parse this JSON data, do
//
//     final customer = customerFromJson(jsonString);

import 'dart:convert';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  Customer({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  List<Datum> data;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        status: json["status"],
        code: json["code"],
        data: json["code"]==200?(List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))):[],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.customerId,
    required this.customerName,
    required this.customerEmail,
    required this.customerPhone,
    required this.customerAddress,
    required this.customerDob,
    required this.customerPassword,
    required this.customerPhoto,
  });

  String customerId;
  String customerName;
  String customerEmail;
  String customerPhone;
  String customerAddress;
  String customerDob;

  //DateTime customerDob;
  String customerPassword;
  String customerPhoto;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        customerId: json["customerID"] ?? '',
        customerName: json["customerName"] ?? '',
        customerEmail: json["customerEmail"] ?? '',
        customerPhone: json["customerPhone"] ?? '',
        customerAddress: json["customerAddress"] ?? '',
        customerDob: json["customerDOB"] ?? '',
        customerPassword: json["customerPassword"] ?? '',
        customerPhoto: json["customerPhoto"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "customerID": customerId,
        "customerName": customerName,
        "customerEmail": customerEmail,
        "customerPhone": customerPhone,
        "customerAddress": customerAddress,
        "customerDOB": customerDob,
        //   "${customerDob.year.toString().padLeft(4, '0')}-${customerDob.month.toString().padLeft(2, '0')}-${customerDob.day.toString().padLeft(2, '0')}",
        "customerPassword": customerPassword,
        "customerPhoto": customerPhoto,
      };
}
