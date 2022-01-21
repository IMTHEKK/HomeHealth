// To parse this JSON data, do
//
//     final customer = customerFromJson(jsonString);

import 'dart:convert';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  Customer({
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
  String customerPassword;
  String customerPhoto;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        customerId: json['customerID'] ?? '',
        customerName: json['customerName'] ?? '',
        customerEmail: json['customerEmail'] ?? '',
        customerPhone: json['customerPhone'] ?? '',
        customerAddress: json['customerAddress'] ?? '',
        customerDob: json['customerDOB'] ?? '',
        customerPassword: json['customerPassword'] ?? '',
        customerPhoto: json['customerPhoto'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'customerID': customerId,
        'customerName': customerName,
        'customerEmail': customerEmail,
        'customerPhone': customerPhone,
        'customerAddress': customerAddress,
        'customerDOB': customerDob,
        'customerPassword': customerPassword,
        'customerPhoto': customerPhoto,
      };
}
