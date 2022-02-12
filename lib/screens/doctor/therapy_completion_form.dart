import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/utilities/utils.dart';

class TherapyCompletionForm extends StatefulWidget {
  final dId, cId;

  TherapyCompletionForm({Key? key, this.dId, this.cId}) : super(key: key);

  @override
  _TherapyCompletionFormState createState() => _TherapyCompletionFormState();
}

class _TherapyCompletionFormState extends State<TherapyCompletionForm> {
  var occupationController = TextEditingController();
  var genderController = TextEditingController();
  var therapyController = TextEditingController();
  var appointmentDateController = TextEditingController();
  var passwordController = TextEditingController();
  var appointmentTimeController = TextEditingController();
  var patientConcernController = TextEditingController();
  var nameController = TextEditingController();
  var injuryController = TextEditingController();
  var historyController = TextEditingController();
  var sComplaintsController = TextEditingController();
  var previousHxRxController = TextEditingController();

  bool isVisible = false;

  int? _gender = 0;
  int? _appointmentDate = 0;

  var _value1;

  int tag = 1;

  // multiple choice value
  List<String> tags = [];

  // list of string options
  List<String> options = [
    'bending',
    'sitting',
    'running',
    'standing',
    'walking',
    'extension',
    'still/move',
    'lying supine',
    'R L',
    'prone',
    'am',
    'as day progresses',
    'pm',
    'other'
  ];

  var outcomeMeasuresController;
  var hrsPatternController;
  var activitiesController;

  var showvalue;

  var resultsController;

  bool isValid() {
    if (nameController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter your full name");
      return false;
    } else if (occupationController.text.toString().isEmpty) {
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
                                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
                                child: Text(
                                  'Therapy Completion Form',
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
                                    controller: occupationController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "DOB",
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
                                    controller: occupationController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Assessment Date",
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
                                    controller: injuryController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Date of Injury",
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
                                    controller: occupationController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Occupation",
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
                                    controller: occupationController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "OFF Work",
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
                              Text('Subjective History'.toUpperCase()),
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
                                    controller: historyController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Current History",
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
                                child: ListTile(
                                  title: TextField(
                                    controller: sComplaintsController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Subjective Complaints",
                                        fillColor: Colors.white70),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Text('Aggravating Factors'),
                              ChipsChoice<String>.multiple(
                                value: tags,
                                onChanged: (val) => {print(tags), setState(() => tags = val)},
                                choiceItems: C2Choice.listFrom<String, String>(
                                  source: options,
                                  value: (i, v) => v,
                                  label: (i, v) => v,
                                ),
                                choiceStyle: C2ChoiceStyle(
                                  color: Colors.orange,
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                ),
                                wrapped: true,
                                textDirection: TextDirection.rtl,
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
                                    controller: previousHxRxController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Previous Hx / Rx",
                                        fillColor: Colors.white70),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Text('Present Symptoms'.toUpperCase()),
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
                                    controller: outcomeMeasuresController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Outcome Measures",
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
                                child: ListTile(
                                  title: TextField(
                                    controller: hrsPatternController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "24 Hrs Pattern",
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
                                child: ListTile(
                                  title: TextField(
                                    controller: activitiesController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Activities/Hobbies",
                                        fillColor: Colors.white70),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Text('Diagnostics Tests'),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Row(
                                children: [
                                  Text('X-Rays'),
                                  Row(
                                    children: [
                                      /*Checkbox(
                                        value: this.showvalue,
                                        onChanged: (var value) {
                                          setState(() {
                                            this.showvalue = value;
                                          });
                                        },
                                      ),*/
                                      Text('Yes'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      /*Checkbox(
                                        value: this.showvalue,
                                        onChanged: (var value) {
                                          setState(() {
                                            this.showvalue = value;
                                          });
                                        },
                                      ),*/
                                      Text('No'),
                                    ],
                                  ),
                                ],
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
                                    controller: resultsController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Results",
                                        fillColor: Colors.white70),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Text('Symptoms Have'),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: true,//this.showvalue,
                                        onChanged: (value) {
                                          setState(() {
                                          //  this.showvalue = value;
                                          });
                                        },
                                      ),
                                      Text('Improved'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      /*Checkbox(
                                        value: this.showvalue,
                                        onChanged: (var value) {
                                          setState(() {
                                            this.showvalue = value;
                                          });
                                        },
                                      ),*/
                                      Text('Unchanged'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      /*Checkbox(
                                        value: this.showvalue,
                                        onChanged: (var value) {
                                          setState(() {
                                            this.showvalue = value;
                                          });
                                        },
                                      ),*/
                                      Text('Worsened'),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Sleep Disturbed: '),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: true,//this.showvalue,
                                        onChanged: (value) {
                                          setState(() {
                                            //  this.showvalue = value;
                                          });
                                        },
                                      ),
                                      Text('Yes'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      /*Checkbox(
                                        value: this.showvalue,
                                        onChanged: (var value) {
                                          setState(() {
                                            this.showvalue = value;
                                          });
                                        },
                                      ),*/
                                      Text('No'),
                                    ],
                                  ),
                                ],
                              ),

                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                                      'age': occupationController.text.toString(),
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
                                            "Finish Therapy",
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
