class MyTherapiesModel {
  late String _status;
  late int _code;
  late List<MyTherapiesList> _data;

  MyTherapiesModel({required String status,required  int code, required List<MyTherapiesList> data}) {
    if (status != null) {
      this._status = status;
    }
    if (code != null) {
      this._code = code;
    }
    if (data != null) {
      this._data = data;
    }
  }

  String get status => _status;

  set status(String status) => _status = status;

  int get code => _code;

  set code(int code) => _code = code;

  List<MyTherapiesList> get data => _data;

  set data(List<MyTherapiesList> data) => _data = data;

  MyTherapiesModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _code = json['code'];
    if (json['data'] != null) {
      _data = <MyTherapiesList>[];
      json['data'].forEach((v) {
        _data!.add(new MyTherapiesList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['code'] = this._code;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyTherapiesList {
  late String _bookingId;
  late String _patientName;
  late  String _therapy;
  late  String _gender;
  late  String _age;
  late  String _bookingTime;
  late  String _appointmentDate;
  late  String _appointmentTime;
  late  String _patientConcern;
  late  String _status;
  late  String _doctorID;
  late  String _customerID;

  MyTherapiesList(
      {required String bookingId,
      required String patientName,
      required String therapy,
      required String gender,
      required String age,
      required String bookingTime,
      required String appointmentDate,
      required String appointmentTime,
      required String patientConcern,
      required String status,
      required String doctorID,
      required String customerID}) {
    if (bookingId != null) {
      this._bookingId = bookingId;
    }
    if (patientName != null) {
      this._patientName = patientName;
    }
    if (therapy != null) {
      this._therapy = therapy;
    }
    if (gender != null) {
      this._gender = gender;
    }
    if (age != null) {
      this._age = age;
    }
    if (bookingTime != null) {
      this._bookingTime = bookingTime;
    }
    if (appointmentDate != null) {
      this._appointmentDate = appointmentDate;
    }
    if (appointmentTime != null) {
      this._appointmentTime = appointmentTime;
    }
    if (patientConcern != null) {
      this._patientConcern = patientConcern;
    }
    if (status != null) {
      this._status = status;
    }
    if (doctorID != null) {
      this._doctorID = doctorID;
    }
    if (customerID != null) {
      this._customerID = customerID;
    }
  }

  String get bookingId => _bookingId;

  set bookingId(String bookingId) => _bookingId = bookingId;

  String get patientName => _patientName;

  set patientName(String patientName) => _patientName = patientName;

  String get therapy => _therapy;

  set therapy(String therapy) => _therapy = therapy;

  String get gender => _gender;

  set gender(String gender) => _gender = gender;

  String get age => _age;

  set age(String age) => _age = age;

  String get bookingTime => _bookingTime;

  set bookingTime(String bookingTime) => _bookingTime = bookingTime;

  String get appointmentDate => _appointmentDate;

  set appointmentDate(String appointmentDate) =>
      _appointmentDate = appointmentDate;

  String get appointmentTime => _appointmentTime;

  set appointmentTime(String appointmentTime) =>
      _appointmentTime = appointmentTime;

  String get patientConcern => _patientConcern;

  set patientConcern(String patientConcern) => _patientConcern = patientConcern;

  String get status => _status;

  set status(String status) => _status = status;

  String get doctorID => _doctorID;

  set doctorID(String doctorID) => _doctorID = doctorID;

  String get customerID => _customerID;

  set customerID(String customerID) => _customerID = customerID;

  MyTherapiesList.fromJson(Map<String, dynamic> json) {
    _bookingId = json['booking_id'];
    _patientName = json['patient_name'];
    _therapy = json['therapy'];
    _gender = json['gender'];
    _age = json['age'];
    _bookingTime = json['bookingTime'];
    _appointmentDate = json['appointment_date'];
    _appointmentTime = json['appointment_time'];
    _patientConcern = json['patient_concern'];
    _status = json['status'];
    _doctorID = json['doctorID'];
    _customerID = json['customerID'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_id'] = this._bookingId;
    data['patient_name'] = this._patientName;
    data['therapy'] = this._therapy;
    data['gender'] = this._gender;
    data['age'] = this._age;
    data['bookingTime'] = this._bookingTime;
    data['appointment_date'] = this._appointmentDate;
    data['appointment_time'] = this._appointmentTime;
    data['patient_concern'] = this._patientConcern;
    data['status'] = this._status;
    data['doctorID'] = this._doctorID;
    data['customerID'] = this._customerID;
    return data;
  }
}
