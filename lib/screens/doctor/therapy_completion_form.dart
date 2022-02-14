import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/utilities/utils.dart';

class TherapyCompletionForm extends StatefulWidget {
  final dId, cId, therapyId;

  TherapyCompletionForm({Key? key, this.dId, this.cId, this.therapyId}) : super(key: key);

  @override
  _TherapyCompletionFormState createState() => _TherapyCompletionFormState();
}

class _TherapyCompletionFormState extends State<TherapyCompletionForm> {
  var clientNameController = TextEditingController();
  var occupationController = TextEditingController();
  var dobController = TextEditingController();
  var assessmentDateController = TextEditingController();
  var injuryDateController = TextEditingController();
  var sinceController = TextEditingController();
  var historyController = TextEditingController();
  var sComplaintsController = TextEditingController();
  var previousHxRxController = TextEditingController();
  var scaleController = TextEditingController();
  var outcomeController = TextEditingController();
  var patternController = TextEditingController();
  var hobbiesController = TextEditingController();
  var resultsController = TextEditingController();
  var headachesController = TextEditingController();
  var observationsController = TextEditingController();
  var movementController = TextEditingController();
  var activeController = TextEditingController();
  var passiveController = TextEditingController();
  var resistedController = TextEditingController();
  var symptomsController = TextEditingController();
  var palpationController = TextEditingController();
  var analysisController = TextEditingController();
  var specialTestsController = TextEditingController();
  var slrController = TextEditingController();
  var vaController = TextEditingController();
  var slumpController = TextEditingController();
  var ulttController = TextEditingController();
  var pkbController = TextEditingController();
  var stabilityController = TextEditingController();
  var treatmentPlanController = TextEditingController();

  bool isVisible = false;
  bool? offWorkBool = false;
  bool? driveBool = false;
  bool? passengerBool = false;
  bool? painBool = false;
  bool? xrayBool = false;
  bool? nilBool = false;
  bool? nsaidsBool = false;
  bool? analgBool = false;
  bool? otherBool = false;
  bool? improvedBool = false;
  bool? unchangedBool = false;
  bool? worsenedBool = false;
  bool? sleepBool = false;
  bool? reflexesBool = false;
  bool? myotomesBool = false;
  bool? sensationBool = false;
  bool? informedConsentBool = false;
  bool? riskBool = false;

  bool isValid() {
    if (clientNameController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter Client Name ');
      return false;
    } else if (dobController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please select Date of Birth');
      return false;
    } else if (occupationController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter occupation');
      return false;
    } else if (assessmentDateController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please Select Assessment Date');
      return false;
    } else if (injuryDateController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please select Date of Injury');
      return false;
    }
    /*else if (sinceController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter your occupation');
      return false;
    } */
    else if (historyController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter current History');
      return false;
    } else if (sComplaintsController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter subjective Complaints');
      return false;
    } else if (previousHxRxController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter previous Hx/Rx');
      return false;
    }
    /*else if (scaleController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter your occupation');
      return false;
    }*/
    else if (outcomeController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter outcome measures');
      return false;
    } else if (patternController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter 24 Hrs pattern');
      return false;
    } else if (hobbiesController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter Activities/Hobbies');
      return false;
    } else if (resultsController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter results');
      return false;
    } else if (headachesController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter headaches');
      return false;
    } else if (observationsController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter observation/postures');
      return false;
    } else if (movementController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter movement');
      return false;
    }
    /* else if (activeController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter your occupation');
      return false;
    } else if (passiveController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter your occupation');
      return false;
    } else if (resistedController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter your occupation');
      return false;
    } */
    else if (symptomsController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter symptoms');
      return false;
    } else if (palpationController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter palpation');
      return false;
    } else if (analysisController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter analysis Data');
      return false;
    } else if (specialTestsController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter Special tests');
      return false;
    } else if (slrController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter SLR');
      return false;
    } else if (vaController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter VA');
      return false;
    } else if (slumpController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter Slump');
      return false;
    } else if (ulttController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter ULTT');
      return false;
    } else if (pkbController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter PKB');
      return false;
    } else if (stabilityController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter stability');
      return false;
    } else if (treatmentPlanController.text.toString().isEmpty) {
      Utils.showToast(context, 'Please enter Treatment Plan');
      return false;
    }
    return true;
  }

  DateTime selectedDate = DateTime.now();

/*  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context, initialDate: selectedDate, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        appointmentDateController.text =
            selectedDate.year.toString() + '-' + selectedDate.month.toString() + '-' + selectedDate.day.toString();
      });
  }*/

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
                                    controller: clientNameController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Client Name',
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
                                    //controller: occupationController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'DOB',
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
                                        hintText: 'Occupation',
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
                                    //controller: occupationController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Date of Assessment',
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
                                    //controller: Controller,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Date of Injury',
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
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.11,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Text('Off Work'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Yes'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                      // checkColor: Colors.greenAccent,
                                      // activeColor: Colors.red,
                                      value: offWorkBool,
                                      onChanged: (value) {
                                        setState(() {
                                          offWorkBool = value;
                                        });
                                      },
                                    ),
                                    Text('NO'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                      value: !offWorkBool!,
                                      onChanged: (value) {
                                        setState(() {
                                          offWorkBool = !offWorkBool!;
                                        });
                                      },
                                    ),
                                  ],
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
                                    // controller: occupationController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Since',
                                        fillColor: Colors.white70),
                                  ),
                                  //  trailing: Icon(Icons.person),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                              Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.09,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Subjective History'.toUpperCase(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.11,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Text('Drive'),
                                    SizedBox(width: 10),
                                    Checkbox(
                                      // checkColor: Colors.greenAccent,
                                      // activeColor: Colors.red,
                                      value: driveBool,
                                      onChanged: (value) {
                                        setState(() {
                                          driveBool = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.11,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Text('Front Passenger'),
                                    SizedBox(width: 10),
                                    Checkbox(
                                      // checkColor: Colors.greenAccent,
                                      // activeColor: Colors.red,
                                      value: passengerBool,
                                      onChanged: (value) {
                                        setState(() {
                                          passengerBool = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.11,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Text('Rear Passenger'),
                                    SizedBox(width: 10),
                                    Checkbox(
                                      value: !passengerBool!,
                                      onChanged: (value) {
                                        setState(() {
                                          passengerBool = !passengerBool!;
                                        });
                                      },
                                    ),
                                  ],
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
                                    maxLength: 150,
                                    maxLines: 6,
                                    controller: historyController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Current History',
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
                                    maxLength: 150,
                                    maxLines: 6,
                                    controller: sComplaintsController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Subjective Complaints',
                                        fillColor: Colors.white70),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              /*Text('Aggravating Factors'),
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
                              ),*/
                              Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.11,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Aggravating Factors: ',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'bending sitting running standing walking extension still/move lying supine R L prone am as day progresses pm other',
                                            style: TextStyle(fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
                                    maxLength: 150,
                                    maxLines: 6,
                                    controller: previousHxRxController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Previous Hx / Rx',
                                        fillColor: Colors.white70),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                              Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.09,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Present Symptoms'.toUpperCase(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.4,
                                width: MediaQuery.of(context).size.width,
                                child: Image.asset('images/body.jpg'),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width,
                                child: Image.asset('images/scale.jpg'),
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
                                    // controller: outcomeMeasuresController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        //hintText: '',
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
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.11,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Text('No Pain'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                      // checkColor: Colors.greenAccent,
                                      // activeColor: Colors.red,
                                      value: painBool,
                                      onChanged: (value) {
                                        setState(() {
                                          painBool = value;
                                        });
                                      },
                                    ),
                                    Text('Worst Pain'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                      value: !painBool!,
                                      onChanged: (value) {
                                        setState(() {
                                          painBool = !painBool!;
                                        });
                                      },
                                    ),
                                  ],
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
                                    controller: outcomeController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Outcome Measures',
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
                                    controller: patternController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: '24 Hrs Pattern',
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
                                    controller: hobbiesController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Activities/Hobbies',
                                        fillColor: Colors.white70),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                              Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.11,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Diagnostics Tests'),
                                  ],
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.11,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Text('X-Ray: '),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Yes'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                      value: xrayBool,
                                      onChanged: (value) {
                                        setState(() {
                                          xrayBool = value;
                                        });
                                      },
                                    ),
                                    Text('No'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                      value: !xrayBool!,
                                      onChanged: (value) {
                                        setState(() {
                                          xrayBool = !xrayBool!;
                                        });
                                      },
                                    ),
                                  ],
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
                                    controller: resultsController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Results',
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
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.11,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Medications: ',
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.11,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Text('NIL'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                      value: nilBool,
                                      onChanged: (value) {
                                        setState(() {
                                          nilBool = value;
                                        });
                                      },
                                    ),
                                    Text('NSAIDS'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                      value: nsaidsBool,
                                      onChanged: (value) {
                                        setState(() {
                                          nsaidsBool = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.11,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Text('ANALG'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                      value: analgBool,
                                      onChanged: (value) {
                                        setState(() {
                                          analgBool = value;
                                        });
                                      },
                                    ),
                                    Text('Other'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                      value: otherBool,
                                      onChanged: (value) {
                                        setState(() {
                                          otherBool = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.11,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Symptoms Have'),
                                    ],
                                  )),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.11,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: improvedBool, //this.showvalue,
                                          onChanged: (value) {
                                            setState(() {
                                              improvedBool = value;
                                            });
                                          },
                                        ),
                                        Text('Improved'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: unchangedBool,
                                          onChanged: (var value) {
                                            setState(() {
                                              unchangedBool = value;
                                            });
                                          },
                                        ),
                                        Text('Unchanged'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.11,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: worsenedBool,
                                      onChanged: (var value) {
                                        setState(() {
                                          worsenedBool = value;
                                        });
                                      },
                                    ),
                                    Text('Worsened'),
                                  ],
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.11,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Sleep Disturbed: '),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: sleepBool,
                                          onChanged: (value) {
                                            setState(() {
                                              sleepBool = value;
                                            });
                                          },
                                        ),
                                        Text('Yes'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: !sleepBool!,
                                          onChanged: (value) {
                                            setState(() {
                                              sleepBool = !sleepBool!;
                                            });
                                          },
                                        ),
                                        Text('No'),
                                      ],
                                    ),
                                  ],
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
                                    controller: headachesController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Headaches',
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
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.09,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Objective'.toUpperCase(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  )),
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
                                    controller: observationsController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Observations/Postures',
                                        fillColor: Colors.white70),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                              Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.09,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'range of motion'.toUpperCase(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  )),
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
                                    controller: movementController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Movement',
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
                                    controller: activeController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Active',
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
                                    controller: passiveController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Passive',
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
                                    controller: resistedController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Resisted',
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
                                    controller: symptomsController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Symptoms',
                                        fillColor: Colors.white70),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Text('C-Spine'),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                height: MediaQuery.of(context).size.width * 0.6,
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Image.asset('images/cspine.jpg'),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Text('Spinal ROM'),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Text('L-Spine'),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                height: MediaQuery.of(context).size.width * 0.6,
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Image.asset('images/lspine.jpg'),
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
                                    maxLines: 3,
                                    maxLength: 180,
                                    controller: palpationController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Palpation',
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
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.11,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Neurological'.toUpperCase(),
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                    Text(
                                      'Reflexes: ',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: reflexesBool,
                                              onChanged: (value) {
                                                setState(() {
                                                  reflexesBool = value;
                                                });
                                              },
                                            ),
                                            Text('Normal'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: !reflexesBool!,
                                              onChanged: (value) {
                                                setState(() {
                                                  reflexesBool = !reflexesBool!;
                                                });
                                              },
                                            ),
                                            Text('Abnormal'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.11,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Myotomes: ',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: myotomesBool,
                                              onChanged: (value) {
                                                setState(() {
                                                  myotomesBool = value;
                                                });
                                              },
                                            ),
                                            Text('Normal'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: !myotomesBool!,
                                              onChanged: (value) {
                                                setState(() {
                                                  myotomesBool = !myotomesBool!;
                                                });
                                              },
                                            ),
                                            Text('Abnormal'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.11,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sensation: ',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: sensationBool,
                                              onChanged: (value) {
                                                setState(() {
                                                  sensationBool = value;
                                                });
                                              },
                                            ),
                                            Text('Normal'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: !sensationBool!,
                                              onChanged: (value) {
                                                setState(() {
                                                  sensationBool = !sensationBool!;
                                                });
                                              },
                                            ),
                                            Text('Abnormal'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
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
                                    maxLines: 3,
                                    maxLength: 180,
                                    controller: analysisController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Analysis',
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
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.11,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Informed Consent Given: ',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: informedConsentBool,
                                              onChanged: (value) {
                                                setState(() {
                                                  informedConsentBool = value;
                                                });
                                              },
                                            ),
                                            Text('Yes'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: !informedConsentBool!,
                                              onChanged: (value) {
                                                setState(() {
                                                  informedConsentBool = !informedConsentBool!;
                                                });
                                              },
                                            ),
                                            Text('No'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.11,
                                  right: MediaQuery.of(context).size.width * 0.07,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Risk \& Benefits Explained: ',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: riskBool,
                                              onChanged: (value) {
                                                setState(() {
                                                  riskBool = value;
                                                });
                                              },
                                            ),
                                            Text('Yes'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: !riskBool!,
                                              onChanged: (value) {
                                                setState(() {
                                                  riskBool = !riskBool!;
                                                });
                                              },
                                            ),
                                            Text('No'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
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
                                    maxLines: 3,
                                    maxLength: 180,
                                    controller: specialTestsController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Special Tests',
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
                                    controller: slrController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'SLR',
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
                                    controller: vaController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'VA',
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
                                    controller: slumpController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Slump',
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
                                    controller: ulttController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'ULTT',
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
                                    controller: pkbController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'PKB',
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
                                    controller: stabilityController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Stability',
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
                                    maxLength: 180,
                                    maxLines: 5,
                                    controller: treatmentPlanController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: 'Treatment Plan',
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
                                      'appointment_id': widget.therapyId,
                                      'therapist_comments': 'test',
                                      'status': '3',
                                      'assessment_form': {
                                        'clientNameController': clientNameController.text.toString(),
                                        'occupationController': occupationController.text.toString(),
                                        'dobController': dobController.text.toString(),
                                        'assessmentDateController': assessmentDateController.text.toString(),
                                        'injuryDateController': injuryDateController.text.toString(),
                                        'sinceController': sinceController.text.toString(),
                                        'historyController': historyController.text.toString(),
                                        'sComplaintsController': sComplaintsController.text.toString(),
                                        'previousHxRxController': previousHxRxController.text.toString(),
                                        'scaleController': scaleController.text.toString(),
                                        'outcomeController': outcomeController.text.toString(),
                                        'patternController': patternController.text.toString(),
                                        'hobbiesController': hobbiesController.text.toString(),
                                        'resultsController': resultsController.text.toString(),
                                        'headachesController': headachesController.text.toString(),
                                        'observationsController': observationsController.text.toString(),
                                        'movementController': movementController.text.toString(),
                                        'activeController': activeController.text.toString(),
                                        'passiveController': passiveController.text.toString(),
                                        'resistedController': resistedController.text.toString(),
                                        'symptomsController': symptomsController.text.toString(),
                                        'palpationController': palpationController.text.toString(),
                                        'analysisController': analysisController.text.toString(),
                                        'specialTestsController': specialTestsController.text.toString(),
                                        'slrController': slrController.text.toString(),
                                        'vaController': vaController.text.toString(),
                                        'slumpController': slumpController.text.toString(),
                                        'ulttController': ulttController.text.toString(),
                                        'pkbController': pkbController.text.toString(),
                                        'stabilityController': stabilityController.text.toString(),
                                        'treatmentPlanController': treatmentPlanController.text.toString(),
                                        'offwork': offWorkBool.toString(),
                                        'drive': driveBool.toString(),
                                        'offWorkBool': offWorkBool.toString(),
                                        'driveBool': driveBool.toString(),
                                        'passengerBool': passengerBool.toString(),
                                        'painBool': painBool.toString(),
                                        'xrayBool': xrayBool.toString(),
                                        'nil': nilBool.toString(),
                                        'nsaids': nsaidsBool.toString(),
                                        'analg': analgBool.toString(),
                                        'other': otherBool.toString(),
                                        'improved': improvedBool.toString(),
                                        'unchanged': unchangedBool.toString(),
                                        'worsened': worsenedBool.toString(),
                                        'sleepBool': sleepBool.toString(),
                                        'reflexesBool': reflexesBool.toString(),
                                        'myotomesBool': myotomesBool.toString(),
                                        'sensationBool': sensationBool.toString(),
                                        'informedConsentBool': informedConsentBool.toString(),
                                        'riskBool': riskBool.toString(),
                                      }
                                    };
                                    print('######################' + params.toString());
                                    if (isValid()) {
                                      var res = await commonBloc.hitPostApi(params, ApiUrl.update_appointment_details);
                                      if (res['code'] == 200) {
                                        Utils.showToast(context, '${res['message']}');
                                        Navigator.pop(context);
                                      } else if (res['code'] == 400) {
                                        Utils.showToast(context, '${res['validation-errors']}');
                                      } else {
                                        Utils.showToast(context, 'failed');
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
                                            'Finish Therapy',
                                            style: TextStyle(
                                              color: Colors.white,
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
