import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/utilities/utils.dart';

class AppointmentForm extends StatefulWidget {
  final dId, cId;

  AppointmentForm({Key? key, this.dId, this.cId}) : super(key: key);

  @override
  _AppointmentFormState createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  var ageController = TextEditingController();
  var genderController = TextEditingController();
  var therapyController = TextEditingController();
  var appointmentDateController = TextEditingController();
  var passwordController = TextEditingController();
  var appointmentTimeController = TextEditingController();
  var patientConcernController = TextEditingController();
  var nameController = TextEditingController();
  bool isVisible = false;

  int? _gender = 0;
  int? _appointmentDate = 0;

  bool isValid() {
    if (nameController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter your full name");
      return false;
    } else if (ageController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter your age");
      return false;
    } else if (genderController.text.toString().isEmpty) {
      Utils.showToast(context, "Please choose gender");
      return false;
    } else if (therapyController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter therapy");
      return false;
    } else if (appointmentDateController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter appointment Date");
      return false;
    } else if (patientConcernController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter your Concern");
      return false;
    } else if (appointmentTimeController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter Appointment time");
      return false;
    }
    return true;
  }

  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context, initialDate: selectedDate, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        appointmentDateController.text =
            selectedDate.year.toString() + '-' + selectedDate.month.toString() + '-' + selectedDate.day.toString();
      });
  }

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
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                        ),
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
                        child: Card(
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
                                    controller: nameController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Full Name",
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
                                    controller: ageController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Age",
                                        fillColor: Colors.white70),
                                  ),
                                  //  trailing: Icon(Icons.person),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                                      // right: MediaQuery.of(context).size.width * 0.07,
                                    ),
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.04,
                                      // right: MediaQuery.of(context).size.width * 0.07,
                                    ),
                                    child: DropdownButton(
                                      value: _gender,
                                      items: [
                                        DropdownMenuItem(
                                          child: Text("Select Gender"),
                                          value: 0,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("Male"),
                                          value: 1,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("Female"),
                                          value: 2,
                                        )
                                      ],
                                      onChanged: (int? value) {
                                        setState(() {
                                          _gender = value;
                                          if (value == 0) genderController.text = "";
                                          if (value == 1) genderController.text = "Male";
                                          if (value == 2) genderController.text = "Female";
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              /*SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                                    controller: genderController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Gender",
                                        fillColor: Colors.white70),
                                  ),
                                  trailing: Icon(Icons.mail),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),*/
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
                                    controller: therapyController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Therapy",
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
                                      controller: appointmentDateController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(color: Colors.grey[800]),
                                          hintText: "Appointment Date",
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
                                  // color: Colors.blue,
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: ListTile(
                                  title: TextField(
                                    maxLength: 200,
                                    maxLines: 8,
                                    controller: patientConcernController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Patient Concern",
                                        fillColor: Colors.white70),
                                  ),
                                  /*trailing: Container(
                                    height: 24,
                                    width: 24,
                                    child: Image.asset(
                                      'images/location.png',
                                      color: Colors.grey,
                                    ),
                                  ),*/ //Icon(Icons.admin_panel_settings),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              /* Container(
                                decoration: BoxDecoration(
                                  // color: Colors.blue,
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: ListTile(
                                  title: TextField(
                                    controller: appointmentTimeController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Appointment Time",
                                        fillColor: Colors.white70),
                                  ),
                                  */ /*trailing: Container(
                                    height: 24,
                                    width: 24,
                                    child: Image.asset('images/confirm_pwd.png'),
                                  ),*/ /*
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),*/
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    decoration: BoxDecoration(
                                      // color: Colors.blue,
                                      border: Border.all(
                                        color: Colors.black12,
                                      ),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.07,
                                      // right: MediaQuery.of(context).size.width * 0.07,
                                    ),
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.04,
                                      // right: MediaQuery.of(context).size.width * 0.07,
                                    ),
                                    child: DropdownButton(
                                      value: _appointmentDate,
                                      items: [
                                        DropdownMenuItem(
                                          child: Text("Choose Appointment Time"),
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
                                          _appointmentDate = value;
                                          if (value == 0) appointmentTimeController.text = "";
                                          if (value == 1) appointmentTimeController.text = "09:00-12:00";
                                          if (value == 2) appointmentTimeController.text = "12:00-15:00";
                                          if (value == 3) appointmentTimeController.text = "15:00-18:00";
                                          if (value == 4) appointmentTimeController.text = "18:00-21:00";
                                        });
                                      },
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
                                    Map<String, dynamic> params = {
                                      'age': ageController.text.toString(),
                                      'gender': genderController.text.toString(),
                                      'therapy': therapyController.text.toString(),
                                      'patient_concern': patientConcernController.text.toString(),
                                      'appointment_date': appointmentDateController.text.toString(),
                                      'appointment_time': appointmentTimeController.text.toString(),
                                      'docid': widget.dId.toString(),
                                      'cid': widget.cId.toString(),
                                      'full-name': nameController.text.toString(),
                                    };
                                    print('######################' + params.toString());
                                    if (isValid()) {
                                      var res = await commonBloc.hitPostApi(params, ApiUrl.book_appointment);
                                      if (res['code'] == 200) {
                                        Utils.showToast(context, '${res['message']}');
                                        Navigator.pop(context);
                                      } else if (res['code'] == 400) {
                                        Utils.showToast(context, '${res['validation-errors']}');
                                      } else {
                                        Utils.showToast(context, 'Appointment booking failed');
                                      }
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
