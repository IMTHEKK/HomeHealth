import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled3/models/treatment_details.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/screens/doctor/therapy_completion_form.dart';
import 'package:untitled3/screens/patient/appointment_form1.dart';
import 'package:untitled3/screens/patient/review.dart';

class TherpiesDetailsScreen extends StatefulWidget {
  final apId;

  const TherpiesDetailsScreen({Key? key, this.apId}) : super(key: key);

  @override
  TherpiesDetailsScreenState createState() => TherpiesDetailsScreenState();
}

class TherpiesDetailsScreenState extends State<TherpiesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd0f1ff), //Colors.blue,
      body: SafeArea(
        top: false,
        child: FutureBuilder(
          future: commonBloc.hitGetApi(ApiUrl.treatment_details + "?apid=" + widget.apId),
          builder: (context, AsyncSnapshot snap) {
            if (snap.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              // TreatmentList treatmentList = TreatmentList.fromJson(snap.data);
              TreatmentDetails treatmentList = treatmentDetailsFromJson(json.encode(snap.data));
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    /*  Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[Color(0xff8db8e1), Color(0xff1a9cdb)])),
              ),*/
                    Container(
                      //color: Colors.red,
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xff0098db), //s.white70,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                              color: Color(0xff088ac4), //s.white70,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                bottomLeft: Radius.circular(130),
                                bottomRight: Radius.circular(20),
                              )),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.08,
                        left: MediaQuery.of(context).size.width * 0.04,
                        right: MediaQuery.of(context).size.width * 0.04,
                        bottom: MediaQuery.of(context).size.width * 0.04,
                      ),
                      child: Column(
                        children: [
/*
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.white,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(150.0),
                              child: CachedNetworkImage(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  height: MediaQuery.of(context).size.width * 0.2,
                                  imageUrl: 'https://th.bing.com/th/id/OIP.hw-Sk04AflX4Te0r8K4R9QAAAA?pid=ImgDet&rs=1',
                                  fit: BoxFit.cover,
                                  imageBuilder: (BuildContext context, ImageProvider<dynamic> imageProvider) {
                                    return Image(
                                      image: imageProvider as ImageProvider<Object>,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                  placeholder: (context, url) => const Icon(
                                        Icons.person,
                                      ),
                                  errorWidget: (context, url, error) => const Icon(
                                        Icons.person,
                                      )),
                            ),
                          ),
*/
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            treatmentList.data[0].firstName.toString() +
                                '\t' + //'John Deo',
                                treatmentList.data[0].lastName.toString(), //'John Deo',
                            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                            /* margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.155,
                        right: MediaQuery.of(context).size.width * 0.155,
                      ),*/
                            /*decoration: BoxDecoration(
                              color: Color(0xff59bbeb), //Color(0xff0098db),
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),*/
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.44,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    "DOB: " +
                                        treatmentList.data[0].dob
                                            .toString() /*+
                                        " | Gender: " +
                                        treatmentList.data[0].['gender'].toString()*/
                                    ,
                                    style: TextStyle(
                                      color: Colors.white,
                                      // fontFamily: 'Montserrat',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                          Text(
                            treatmentList.data[0].email.toString(), // 'Massage Therapy',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            treatmentList.data[0].phone.toString(), // 'Massage Therapy',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            treatmentList.data[0].address.toString(), // 'Massage Therapy',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Card(
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.transparent)),
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.07,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Medical Conditions', //'Concern for therapy:',
                                        style: TextStyle(
                                          // fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.01,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.07,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          treatmentList.data[0].medicalConditions.toString(),
                                          //'CLord Ipsum quisque facilisis risus eu orci tempor semper. Vestibulum aliquam purus nec arcu venenatis lobortis. Aliquam et egestas erat. Nullam sed magna urna. Fusce rutrum, arcu eu dignissim malesuada, massa elit malesuada ex, ac dictum sapien ipsum at dolor. Curabitur finibus dui quis metus facilisis, a tincidunt ipsum maximus. Praesent sed justo orci. Quisque cursus dignissim rutrum.',
                                          style: TextStyle(
                                            // fontSize: 18,
                                            color: Colors.grey,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.03,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        right: MediaQuery.of(context).size.width * 0.01,
                                        left: MediaQuery.of(context).size.width * 0.04,
                                        top: MediaQuery.of(context).size.height * 0.02,
                                        bottom: MediaQuery.of(context).size.height * 0.02,
                                      ),
                                      margin: EdgeInsets.only(
                                        right: MediaQuery.of(context).size.width * 0.07,
                                      ),
                                      width: MediaQuery.of(context).size.width * 0.65,
                                      decoration: BoxDecoration(
                                        color: Color(0xff0098db),
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Session date \& time",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  // fontFamily: 'Montserrat',
                                                  fontSize: 16,
                                                  //fontWeight: FontWeight.w600,
                                                  // letterSpacing: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 18,
                                                width: 18,
                                                child: Image.asset('images/calendar1.png', color: Colors.white),
                                              ),
                                              /*          Icon(
                                          Icons.calendar_today_sharp,
                                          color: Colors.white,
                                          size: 18,
                                        ),*/
                                              SizedBox(width: 10),
                                              Center(
                                                child: Text(
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(treatmentList.data[0].appointmentDate)
                                                      .toString() +
                                                      '\t\t' +
                                                      treatmentList.data[0].appointmentTime.toString(),

//                                                  "05 Jan,2022 | 3:30 PM",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    // fontFamily: 'Montserrat',
                                                    fontSize: 16,
                                                    //fontWeight: FontWeight.w600,
                                                    // letterSpacing: 1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.04,
                                ),
                                /*  Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.07,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 24,
                                        width: 24,
                                        child: Image.asset('images/treatment_prog.png'),
                                      ),
                                      */ /* Icon(
                                  Icons.assignment_ind_sharp,
                                  color: Colors.blue,
                                ),*/ /*
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Treatment progress",
                                        style: TextStyle(
                                          color: Color(0xff0098db),
                                          // fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          // letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.02,
                                ),*/
                                /*Container(
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.12,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                            child: Row(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 18,
                                      width: 18,
                                      child: Image.asset('images/calendar1.png'),),       SizedBox(width: 8),
                                    Center(
                                      child: Text(
                                        "05 Jan,2022 | 3:30 PM",
                                        style: TextStyle(
                                          fontSize: 8,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xff0098db),
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 18,
                                              width: 18,
                                              child: Image.asset('images/comment.png',color:Colors.white),),       SizedBox(width: 8),
                                            SizedBox(width: 8),
                                            Center(
                                              child: Text(
                                                "Comment",
                                                style: TextStyle(
                                                  //fontSize: 8,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.32,
                                        ),
                                        child:
                                        Center(
                                          child: SizedBox(
                                            width: 25,
                                            height: 25,
                                            child: FittedBox(
                                              child: FloatingActionButton(
                                                backgroundColor: Colors.white,
                                                elevation: 5,
                                                onPressed: () {},
                                                child: Icon(
                                                  Icons.add,
                                                  size: 36,
                                                  color: Color(0xff0098db),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.04,
                                    top: MediaQuery.of(context).size.height * 0.02,
                                    bottom: MediaQuery.of(context).size.height * 0.02,
                                    right: MediaQuery.of(context).size.width * 0.04,
                                  ),
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.07,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                    top: MediaQuery.of(context).size.height * 0.01,
                                    bottom: MediaQuery.of(context).size.height * 0.01,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 4),
                                            color: Color(0xffebebeb), //edited
                                            spreadRadius: 4,
                                            blurRadius: 10 //edited
                                            )
                                      ]),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'CLord Ipsum quisque facilisis risus eu orci tempor semper. Vestibulum aliquam purus nec arcu venenatis lobortis. Aliquam et egestas erat. Nullam sed magna urna. Fusce rutrum, arcu eu dignissim malesuada, massa elit malesuada ex, ac dictum sapien ipsum at dolor. Curabitur finibus dui quis metus facilisis, a tincidunt ipsum maximus. Praesent sed justo orci. Quisque cursus dignissim rutrum.',
                                          style: TextStyle(
                                            // fontSize: 18,
                                            color: Colors.grey,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                            */ /*Container(
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: false,
                                  onChanged: (bool? value) {},
                                ),
                                Text('is the complete therapy'),
                              ],
                            ),
                          ),*/
                                /*     SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                         Container(
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AppointmentList()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xff0098db),
                                  border: Border.all(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        "submit",
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
                          SizedBox(height: MediaQuery.of(context).size.height * 0.06),*/
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.07,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Injured Area', //'Concern for therapy:',
                                        style: TextStyle(
                                          // fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.01,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.07,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          treatmentList.data[0].injuredArea.toString(),
                                          //'CLord Ipsum quisque facilisis risus eu orci tempor semper. Vestibulum aliquam purus nec arcu venenatis lobortis. Aliquam et egestas erat. Nullam sed magna urna. Fusce rutrum, arcu eu dignissim malesuada, massa elit malesuada ex, ac dictum sapien ipsum at dolor. Curabitur finibus dui quis metus facilisis, a tincidunt ipsum maximus. Praesent sed justo orci. Quisque cursus dignissim rutrum.',
                                          style: TextStyle(
                                            // fontSize: 18,
                                            color: Colors.grey,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.03,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.07,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Medications', //'Concern for therapy:',
                                        style: TextStyle(
                                          // fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.01,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.07,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          treatmentList.data[0].medications.toString(),
                                          //'CLord Ipsum quisque facilisis risus eu orci tempor semper. Vestibulum aliquam purus nec arcu venenatis lobortis. Aliquam et egestas erat. Nullam sed magna urna. Fusce rutrum, arcu eu dignissim malesuada, massa elit malesuada ex, ac dictum sapien ipsum at dolor. Curabitur finibus dui quis metus facilisis, a tincidunt ipsum maximus. Praesent sed justo orci. Quisque cursus dignissim rutrum.',
                                          style: TextStyle(
                                            // fontSize: 18,
                                            color: Colors.grey,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.03,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.07,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'XRAY / MRI / UltraSound', //'Concern for therapy:',
                                        style: TextStyle(
                                          // fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.01,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.07,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          treatmentList.data[0].xray.toString(),
                                          //'CLord Ipsum quisque facilisis risus eu orci tempor semper. Vestibulum aliquam purus nec arcu venenatis lobortis. Aliquam et egestas erat. Nullam sed magna urna. Fusce rutrum, arcu eu dignissim malesuada, massa elit malesuada ex, ac dictum sapien ipsum at dolor. Curabitur finibus dui quis metus facilisis, a tincidunt ipsum maximus. Praesent sed justo orci. Quisque cursus dignissim rutrum.',
                                          style: TextStyle(
                                            // fontSize: 18,
                                            color: Colors.grey,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.03,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.07,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Family Doctor', //'Concern for therapy:',
                                        style: TextStyle(
                                          // fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.01,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.07,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          treatmentList.data[0].familyDoctor.toString(),
                                          //'CLord Ipsum quisque facilisis risus eu orci tempor semper. Vestibulum aliquam purus nec arcu venenatis lobortis. Aliquam et egestas erat. Nullam sed magna urna. Fusce rutrum, arcu eu dignissim malesuada, massa elit malesuada ex, ac dictum sapien ipsum at dolor. Curabitur finibus dui quis metus facilisis, a tincidunt ipsum maximus. Praesent sed justo orci. Quisque cursus dignissim rutrum.',
                                          style: TextStyle(
                                            // fontSize: 18,
                                            color: Colors.grey,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.05,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.07,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Emergency Contact Details', //'Concern for therapy:',
                                        style: TextStyle(
                                          // fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.07,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Text('Name: ' + treatmentList.data[0].emergencyContactName),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.07,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Text('Contact Number: ' + treatmentList.data[0].emergencyContactNumber),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.07,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Text('Relationship: ' + treatmentList.data[0].emergencyContactRelation),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                if( treatmentList.data[0].status=='0')
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.07,
                                      right: MediaQuery.of(context).size.width * 0.07,
                                    ),
                                    child: Text(
                                      'Treatment Status: Requesting for Appointment',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),),
                                if( treatmentList.data[0].status=='0')
                                  SizedBox(height: 10),
                                if( treatmentList.data[0].status=='2')
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.07,
                                      right: MediaQuery.of(context).size.width * 0.07,
                                    ),
                                    child:Text(
                                      'Treatment Status: Request Cancelled',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),),
                                if( treatmentList.data[0].status=='2')
                                  SizedBox(height: 10),
                                if( treatmentList.data[0].status=='1')
                                  InkWell(
                                    onTap:(){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TherapyCompletionForm(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin:EdgeInsets.only(
                                        left: MediaQuery.of(context).size.width * 0.04,
                                        right: MediaQuery.of(context).size.width * 0.04,
                                        bottom: MediaQuery.of(context).size.height * 0.02,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                        color: Colors.orangeAccent,
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width * 0.04,
                                          right: MediaQuery.of(context).size.width * 0.04,
                                          top: MediaQuery.of(context).size.height * 0.008,
                                          bottom: MediaQuery.of(context).size.height * 0.008,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Complete Therapy',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  /*Container(
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.07,
                                      right: MediaQuery.of(context).size.width * 0.07,
                                    ),
                                    child: Text(
                                      'Treatment Status: Appointment Request Acccepted',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),),*/
                                if( treatmentList.data[0].status=='1')
                                  SizedBox(height: 10),
                                if( treatmentList.data[0].status=='3')
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.07,
                                      right: MediaQuery.of(context).size.width * 0.07,
                                    ),
                                    child:Text(
                                      'Treatment Status: Completed',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),),
                                if( treatmentList.data[0].status=='3')
                                  SizedBox(height: 10),
                                //if( treatmentList.data[0].status=='3')
                                if( treatmentList.data[0].status=='3')
//                                  InkWell(
//                                    onTap: () {
//                                      Navigator.push(
//                                          context,
//                                          MaterialPageRoute(
//                                              builder: (context) => ReviewScreen(
//                                                dId: treatmentList.data[0].doctorId,
//                                                cId: treatmentList.data[0].customerId,
//                                                aId: treatmentList.data[0].bookingId,
//                                              )));
//                                    },
//                                    child: Container(
//                                      margin: EdgeInsets.only(
//                                        left: MediaQuery.of(context).size.width * 0.07,
//                                        right: MediaQuery.of(context).size.width * 0.07,
//                                      ),
//                                      width: MediaQuery.of(context).size.width * 0.4,
//                                      decoration: BoxDecoration(
//                                        border: Border.all(
//                                          color: Colors.blue,
//                                        ),
//                                        borderRadius: BorderRadius.circular(8.0),
//                                      ),
//                                      child: Padding(
//                                        padding: EdgeInsets.only(
//                                          left: MediaQuery.of(context).size.width * 0.04,
//                                          right: MediaQuery.of(context).size.width * 0.04,
//                                          top: MediaQuery.of(context).size.height * 0.008,
//                                          bottom: MediaQuery.of(context).size.height * 0.008,
//                                        ),
//                                        child: Center(
//                                          child: Text(
//                                            'Complete This Thepary',
//                                            style: TextStyle(
//                                              color: Colors.blue,
//                                              fontWeight: FontWeight.bold,
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                    ),
//                                  ),
                                if( treatmentList.data[0].status=='3')
                                  SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: null,
                              ),
                            ),
                          ),
                          /*Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              icon: Icon(
                                CupertinoIcons.ellipsis,
                                color: Colors.white,
                              ),
                              onPressed: null,
                            ),
                          ),*/
                          //  Icon(Icons.)
                        ],
                      ),
                    ),
/*
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.03,
                    top: MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigator.pop(context);
*/ /*
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointmentList()));
*/ /*
                },
                child: Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.86,
                    top: MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: Icon(
                    Icons.menu,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              ),*/
                  ],
                ),
              );
            } //do whatever you want
          },
        ),
      ),
    );
  }
}
