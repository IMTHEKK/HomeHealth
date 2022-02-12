class MyTherapiesModel {
  String? _status;
  late int _code;
  late List<MyTherapiesList> _data;

  MyTherapiesModel(
      {required String status,
      required int code,
      required List<MyTherapiesList> data}) {
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

  String? get status => _status;

  set status(String? status) => _status = status;

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
        _data.add(new MyTherapiesList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['code'] = this._code;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyTherapiesList {
  late String _bookingId;
  late String _customerID;
  late String _doctorID;
  late String _firstName;
  late String _lastName;
  late String _dob;
  late String _address;
  late String _phone;
  late String _email;
  late String _familyDoctor;
  late String _medicalConditions;
  late String _injuredArea;
  late String _xray;
  late String _medications;
  late String _emergencyContactName;
  late String _emergencyContactRelation;
  late String _emergencyContactNumber;
  late String _appointmentDate;
  late String _appointmentTime;
  late String _status;
  late String _bookingTime;

  MyTherapiesList(
      {required String bookingId,
      required String customerID,
      required String doctorID,
      required String firstName,
      required String lastName,
      required String dob,
      required String address,
      required String phone,
      required String email,
      required String familyDoctor,
      required String medicalConditions,
      required String injuredArea,
      required String xray,
      required String medications,
      required String emergencyContactName,
      required String emergencyContactRelation,
      required String emergencyContactNumber,
      required String appointmentDate,
      required String appointmentTime,
      required String status,
      required String bookingTime}) {
    if (bookingId != null) {
      this._bookingId = bookingId;
    }
    if (customerID != null) {
      this._customerID = customerID;
    }
    if (doctorID != null) {
      this._doctorID = doctorID;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (dob != null) {
      this._dob = dob;
    }
    if (address != null) {
      this._address = address;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (email != null) {
      this._email = email;
    }
    if (familyDoctor != null) {
      this._familyDoctor = familyDoctor;
    }
    if (medicalConditions != null) {
      this._medicalConditions = medicalConditions;
    }
    if (injuredArea != null) {
      this._injuredArea = injuredArea;
    }
    if (xray != null) {
      this._xray = xray;
    }
    if (medications != null) {
      this._medications = medications;
    }
    if (emergencyContactName != null) {
      this._emergencyContactName = emergencyContactName;
    }
    if (emergencyContactRelation != null) {
      this._emergencyContactRelation = emergencyContactRelation;
    }
    if (emergencyContactNumber != null) {
      this._emergencyContactNumber = emergencyContactNumber;
    }
    if (appointmentDate != null) {
      this._appointmentDate = appointmentDate;
    }
    if (appointmentTime != null) {
      this._appointmentTime = appointmentTime;
    }
    if (status != null) {
      this._status = status;
    }
    if (bookingTime != null) {
      this._bookingTime = bookingTime;
    }
  }

  String get bookingId => _bookingId;

  set bookingId(String bookingId) => _bookingId = bookingId;

  String get customerID => _customerID;

  set customerID(String customerID) => _customerID = customerID;

  String get doctorID => _doctorID;

  set doctorID(String doctorID) => _doctorID = doctorID;

  String get firstName => _firstName;

  set firstName(String firstName) => _firstName = firstName;

  String get lastName => _lastName;

  set lastName(String lastName) => _lastName = lastName;

  String get dob => _dob;

  set dob(String dob) => _dob = dob;

  String get address => _address;

  set address(String address) => _address = address;

  String get phone => _phone;

  set phone(String phone) => _phone = phone;

  String get email => _email;

  set email(String email) => _email = email;

  String get familyDoctor => _familyDoctor;

  set familyDoctor(String familyDoctor) => _familyDoctor = familyDoctor;

  String get medicalConditions => _medicalConditions;

  set medicalConditions(String medicalConditions) =>
      _medicalConditions = medicalConditions;

  String get injuredArea => _injuredArea;

  set injuredArea(String injuredArea) => _injuredArea = injuredArea;

  String get xray => _xray;

  set xray(String xray) => _xray = xray;

  String get medications => _medications;

  set medications(String medications) => _medications = medications;

  String get emergencyContactName => _emergencyContactName;

  set emergencyContactName(String emergencyContactName) =>
      _emergencyContactName = emergencyContactName;

  String get emergencyContactRelation => _emergencyContactRelation;

  set emergencyContactRelation(String emergencyContactRelation) =>
      _emergencyContactRelation = emergencyContactRelation;

  String get emergencyContactNumber => _emergencyContactNumber;

  set emergencyContactNumber(String emergencyContactNumber) =>
      _emergencyContactNumber = emergencyContactNumber;

  String get appointmentDate => _appointmentDate;

  set appointmentDate(String appointmentDate) =>
      _appointmentDate = appointmentDate;

  String get appointmentTime => _appointmentTime;

  set appointmentTime(String appointmentTime) =>
      _appointmentTime = appointmentTime;

  String get status => _status;

  set status(String status) => _status = status;

  String get bookingTime => _bookingTime;

  set bookingTime(String bookingTime) => _bookingTime = bookingTime;

  MyTherapiesList.fromJson(Map<String, dynamic> json) {
    _bookingId = json['booking_id'];
    _customerID = json['customerID'];
    _doctorID = json['doctorID'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _dob = json['dob'];
    _address = json['address'];
    _phone = json['phone'];
    _email = json['email'];
    _familyDoctor = json['family_doctor'];
    _medicalConditions = json['medical_conditions'];
    _injuredArea = json['injured_area'];
    _xray = json['xray'];
    _medications = json['medications'];
    _emergencyContactName = json['emergency_contact_name'];
    _emergencyContactRelation = json['emergency_contact_relation'];
    _emergencyContactNumber = json['emergency_contact_number'];
    _appointmentDate = json['appointment_date'];
    _appointmentTime = json['appointment_time'];
    _status = json['status'];
    _bookingTime = json['bookingTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_id'] = this._bookingId;
    data['customerID'] = this._customerID;
    data['doctorID'] = this._doctorID;
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    data['dob'] = this._dob;
    data['address'] = this._address;
    data['phone'] = this._phone;
    data['email'] = this._email;
    data['family_doctor'] = this._familyDoctor;
    data['medical_conditions'] = this._medicalConditions;
    data['injured_area'] = this._injuredArea;
    data['xray'] = this._xray;
    data['medications'] = this._medications;
    data['emergency_contact_name'] = this._emergencyContactName;
    data['emergency_contact_relation'] = this._emergencyContactRelation;
    data['emergency_contact_number'] = this._emergencyContactNumber;
    data['appointment_date'] = this._appointmentDate;
    data['appointment_time'] = this._appointmentTime;
    data['status'] = this._status;
    data['bookingTime'] = this._bookingTime;
    return data;
  }
}
