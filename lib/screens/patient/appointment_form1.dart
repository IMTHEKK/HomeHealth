import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:flutter/src/material/card.dart" as Card1;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:untitled3/models/schedule.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/utilities/utils.dart';

class AppointmentForm1 extends StatefulWidget {
  final dId, cId;

  AppointmentForm1({Key? key, this.dId, this.cId}) : super(key: key);

  @override
  _AppointmentForm1State createState() => _AppointmentForm1State();
}

class _AppointmentForm1State extends State<AppointmentForm1> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var dobController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var familyDoctorController = TextEditingController();
  var medicalConditionsController = TextEditingController();
  var patientConcernController = TextEditingController();
  var injuredAreaController = TextEditingController();
  var xrayController = TextEditingController();
  var medicationsController = TextEditingController();
  var emergencyNameController = TextEditingController();
  var relationshipController = TextEditingController();
  var emergencyPhoneController = TextEditingController();
  var aDateController = TextEditingController();
  var aTimeController = TextEditingController();
  var res;
  bool isVisible = false;
  int? aDate = 0;
  late MySchedule mySchedule;

  bool isValid() {
    if (firstNameController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter First Name");
      return false;
    } else if (lastNameController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter your Last Name");
      return false;
    } else if (dobController.text.toString().isEmpty) {
      Utils.showToast(context, "Please choose DOB");
      return false;
    } else if (addressController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter Address");
      return false;
    } else if (phoneController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter Phone Number");
      return false;
    } else if (emailController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter your Email");
      return false;
    } else if (familyDoctorController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter Family Doctor");
      return false;
    } else if (medicalConditionsController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter medical Conditions");
      return false;
    }
    /*else if (patientConcernController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter patient Concern");
      return false;
    }*/
    else if (injuredAreaController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter injured Area");
      return false;
    } else if (xrayController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter X-Ray/Ultrasound/MRI");
      return false;
    } else if (medicationsController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter medications");
      return false;
    } else if (emergencyNameController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter emergency Contact Name");
      return false;
    } else if (relationshipController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter relationship");
      return false;
    } else if (emergencyPhoneController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter Emergency Phone number");
      return false;
    } else if (aDateController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter Appointment Date");
      return false;
    } else if (aTimeController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter Appointment Time");
      return false;
    }
    return true;
  }

/*
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context, initialDate: selectedDate, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        emailController.text =
            selectedDate.year.toString() + '-' + selectedDate.month.toString() + '-' + selectedDate.day.toString();
      });
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    //color: Colors.red,
                    height: MediaQuery.of(context).size.height * 0.36,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.12),
                                child: Text(
                                  'Appointment Form',
                                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 22),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.055,
                          left: MediaQuery.of(context).size.width * 0.07,
                          right: MediaQuery.of(context).size.width * 0.07,
                          bottom: MediaQuery.of(context).size.width * 0.07,
                        ),
                        child: Card1.Card(
                          elevation: 10,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(38),
                              borderSide: BorderSide(color: Colors.transparent)),
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                              Container(
                                decoration: BoxDecoration(
                                  // color: Colors.blue,
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: ListTile(
                                  title: TextField(
                                    controller: firstNameController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "First Name",
                                        fillColor: Colors.white70),
                                  ),
                                  trailing: Icon(Icons.person),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                decoration: BoxDecoration(
                                  // color: Colors.blue,
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: ListTile(
                                  title: TextField(
                                    controller: lastNameController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Last Name",
                                        fillColor: Colors.white70),
                                  ),
                                  trailing: Icon(Icons.person),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              /*Container(
                                decoration: BoxDecoration(
                                  // color: Colors.blue,
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: ListTile(
                                  title: TextField(
                                    controller: dobController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Date of Birth",
                                        fillColor: Colors.white70),
                                  ),
                                  //  trailing: Icon(Icons.person),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),*/
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1865),
                                      lastDate: DateTime.now(),
                                    ).then((pickedDate1) {
                                      if (pickedDate1 == null) {
                                        return;
                                      }
                                      setState(() {
                                        dobController.text = DateFormat('yyyy-MM-dd').format(pickedDate1);
                                      });
                                    });
                                  },
                                  child: ListTile(
                                    title: /*TextField(
                                      controller: aDateController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(color: Colors.grey[800]),
                                          hintText: "Appointment Date",
                                          fillColor: Colors.white70),
                                    ),*/
                                        Text(dobController.text.toString().isEmpty
                                            ? "Date of Birth"
                                            : dobController.text.toString()),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: ListTile(
                                  title: TextField(
                                    controller: addressController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Address",
                                        fillColor: Colors.white70),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: InkWell(
                                  //  onTap: _selectDate(context),
                                  child: ListTile(
                                    title: TextField(
                                      controller: phoneController,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                      ],
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(color: Colors.grey[800]),
                                          hintText: "Phone",
                                          fillColor: Colors.white70),
                                    ),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: InkWell(
                                  //  onTap: _selectDate(context),
                                  child: ListTile(
                                    title: TextField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(color: Colors.grey[800]),
                                          hintText: "Email",
                                          fillColor: Colors.white70),
                                    ),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: InkWell(
                                  //  onTap: _selectDate(context),
                                  child: ListTile(
                                    title: TextField(
                                      controller: familyDoctorController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(color: Colors.grey[800]),
                                          hintText: "Family Doctor",
                                          fillColor: Colors.white70),
                                    ),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: InkWell(
                                  //  onTap: _selectDate(context),
                                  child: ListTile(
                                    title: TextField(
                                      controller: medicalConditionsController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(color: Colors.grey[800]),
                                          hintText: "Medical Conditions",
                                          fillColor: Colors.white70),
                                    ),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: InkWell(
                                  child: ListTile(
                                    title: TextField(
                                      controller: injuredAreaController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(color: Colors.grey[800]),
                                          hintText: "Injured Area",
                                          fillColor: Colors.white70),
                                    ),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: InkWell(
                                  //  onTap: _selectDate(context),
                                  child: ListTile(
                                    title: TextField(
                                      controller: xrayController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(color: Colors.grey[800]),
                                          hintText: "XRAY/Ultrasound/MRI",
                                          fillColor: Colors.white70),
                                    ),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: InkWell(
                                  child: ListTile(
                                    title: TextField(
                                      controller: medicationsController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(color: Colors.grey[800]),
                                          hintText: "Medications",
                                          fillColor: Colors.white70),
                                    ),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Text('Emergency Contact Information'),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: InkWell(
                                  //  onTap: _selectDate(context),
                                  child: ListTile(
                                    title: TextField(
                                      controller: emergencyNameController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(color: Colors.grey[800]),
                                          hintText: "Name",
                                          fillColor: Colors.white70),
                                    ),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: InkWell(
                                  //  onTap: _selectDate(context),
                                  child: ListTile(
                                    title: TextField(
                                      controller: relationshipController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(color: Colors.grey[800]),
                                          hintText: "Relationship",
                                          fillColor: Colors.white70),
                                    ),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: InkWell(
                                  child: ListTile(
                                    title: TextField(
                                      controller: emergencyPhoneController,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                      ],
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(color: Colors.grey[800]),
                                          hintText: "Phone Number",
                                          fillColor: Colors.white70),
                                    ),
                                    /*trailing: Container(
                                      height: 24,
                                      width: 24,
                                      child: Image.asset(
                                        'images/calendar.png',
                                        color: Colors.grey,
                                      ),
                                    ),*/ //Icon(Icons.admin_panel_settings),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2024),
                                    ).then((pickedDate) async {
                                      if (pickedDate == null) {
                                        return;
                                      }

                                      res = await commonBloc
                                          .hitGetApi(ApiUrl.get_therapist_schedule + '?doctor_id=' + widget.dId);
                                      print('resp:' + json.encode(res).toString());
                                      mySchedule = myScheduleFromJson(json.encode(res));
                                      for (int i = 0; i < mySchedule.data.length; i++) {
                                        if (mySchedule.data[i].scheduleDate ==
                                            DateFormat('yyyy-MM-dd').format(pickedDate)) {}
                                      }
                                      setState(() {
                                        aDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                                      });
                                    });
                                  },
                                  child: ListTile(
                                    title: Text(aDateController.text.toString().isEmpty
                                        ? "Appointment Date"
                                        : aDateController.text.toString()),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
/*
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: InkWell(
                                  child: ListTile(
                                    title: TextField(
                                      controller: aTimeController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(color: Colors.grey[800]),
                                          hintText: "Appointment Time",
                                          fillColor: Colors.white70),
                                    ),
                                    */
/*trailing: Container(
                                      height: 24,
                                      width: 24,
                                      child: Image.asset(
                                        'images/calendar.png',
                                        color: Colors.grey,
                                      ),
                                    ),*/ /*
 //Icon(Icons.admin_panel_settings),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
*/
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    //width: MediaQuery.of(context).size.width * 0.7,
                                    decoration: BoxDecoration(
                                      // color: Colors.blue,
                                      border: Border.all(
                                        color: Colors.black12,
                                      ),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.07,
                                      right: MediaQuery.of(context).size.width * 0.07,
                                    ),
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.04,
                                      right: MediaQuery.of(context).size.width * 0.07,
                                      top: MediaQuery.of(context).size.height * 0.01,
                                      bottom: MediaQuery.of(context).size.height * 0.01,
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        value: aDate,
                                        items: [
                                          DropdownMenuItem(
                                            child: Text("Appointment Time"),
                                            value: 0,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("09:00-12:00"),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("12:00-15:00"),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("15:00-18:00"),
                                            value: 3,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("18:00-21:00"),
                                            value: 4,
                                          )
                                        ],
                                        onChanged: (int? value) {
                                          setState(() {
                                            aDate = value;
                                            if (value == 0) aTimeController.text = "";
                                            if (value == 1) aTimeController.text = "09:00-12:00";
                                            if (value == 2) aTimeController.text = "12:00-15:00";
                                            if (value == 3) aTimeController.text = "15:00-18:00";
                                            if (value == 4) aTimeController.text = "18:00-21:00";
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                height: MediaQuery.of(context).size.height * 0.06,
                                child: GestureDetector(
                                  onTap: () async {
                                    isVisible = true;
                                    setState(() {});
                                    //     '&appointment_date=2022-02-06'
                                    //   '&appointment_time=09:00-12:00'
                                    Map<String, dynamic> params = {
                                      'customer_id': widget.cId.toString(),
                                      'doctor_id': widget.dId.toString(),
                                      'first_name': firstNameController.text.toString(),
                                      'last_name': lastNameController.text.toString(),
                                      'dob': dobController.text.toString(),
                                      'address': addressController.text.toString(),
                                      'phone': phoneController.text.toString(),
                                      'email': emailController.text.toString(),
                                      'family_doctor': familyDoctorController.text.toString(),
                                      'medical_conditions': medicalConditionsController.text.toString(),
                                      'injured_area': injuredAreaController.text.toString(),
                                      // 'xray': injuredAreaController.text.toString(),
                                      'medications': medicationsController.text.toString(),
                                      'xray': xrayController.text.toString(),
                                      'emergency_contact_name': emergencyNameController.text.toString(),
                                      'emergency_contact_relation': relationshipController.text.toString(),
                                      'emergency_contact_number': emergencyPhoneController.text.toString(),
                                      'appointment_date': aDateController.text.toString(),
                                      'appointment_time': aTimeController.text.toString(),
                                    };
                                    print('######################' + params.toString());
                                    if (isValid()) {
                                      var res = await commonBloc.hitPostApi(params, ApiUrl.book_appointment);
                                      if (res['code'] == 200) {
                                        Utils.showToast(context, '${res['message']}');
                                        Navigator.pop(context);
                                      } else
                                        Utils.showToast(context, '${res['validation-errors']}');
                                    }
                                    isVisible = false;
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      border: Border.all(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: Text(
                                            "Book an Appointment",
                                            style: TextStyle(
                                              color: Colors.white,
                                              // fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                              /*TextButton(
                                onPressed: () async {
                                  // create payment method
                                  final paymentMethod =
                                  await Stripe.instance.createPaymentMethod(PaymentMethodParams.card());
                                },
                                child: Text('pay'),
                              )*/
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
              visible: isVisible,
              child: SpinKitFadingCircle(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.red : Colors.green,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
