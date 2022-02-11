// To parse this JSON data, do
//
//     final mySchedule = myScheduleFromJson(jsonString);

import 'dart:convert';

MySchedule myScheduleFromJson(String str) => MySchedule.fromJson(json.decode(str));

String myScheduleToJson(MySchedule data) => json.encode(data.toJson());

class MySchedule {
  MySchedule({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  String status;
  int code;
  String message;
  List<Datum> data;

  factory MySchedule.fromJson(Map<String, dynamic> json) => MySchedule(
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
    required this.isDisabled,
    required this.scheduleDate,
    required this.slotsJson,
  });

  String isDisabled;
  String scheduleDate;
  List<SlotsJson> slotsJson;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        isDisabled: json['is_disabled'] ?? '',
        scheduleDate: json['schedule_date'].toString(),
        slotsJson: List<SlotsJson>.from(json['slots_json'].map((x) => SlotsJson.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'is_disabled': isDisabled,
        'schedule_date': scheduleDate,
        //'${scheduleDate.year.toString().padLeft(4, '0')}-${scheduleDate.month.toString().padLeft(2, '0')}-${scheduleDate.day.toString().padLeft(2, '0')}',
        'slots_json': List<dynamic>.from(slotsJson.map((x) => x.toJson())),
      };
}

class SlotsJson {
  SlotsJson({
    required this.startTime,
    required this.endTime,
    required this.slotsJsonIsDisabled,
    required this.isDisabled,
  });

  String startTime;
  String endTime;
  bool slotsJsonIsDisabled;
  bool isDisabled;

  factory SlotsJson.fromJson(Map<String, dynamic> json) => SlotsJson(
        startTime: json['start_time'] ?? '',
        endTime: json['end_time'] ?? '',
        slotsJsonIsDisabled: json['is_disabled'],
        isDisabled: json['is_disabled'],
      );

  Map<String, dynamic> toJson() => {
        'start_time': startTime,
        'end_time': endTime,
        'is_disabled': slotsJsonIsDisabled,
        'is_disabled': isDisabled,
      };
}
