import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled3/models/treatment_list1.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/screens/patient/ongoing_treatment.dart';
import 'package:untitled3/screens/patient/review.dart';

class TreatmentList extends StatefulWidget {
  final cId;

  const TreatmentList({Key? key, this.cId}) : super(key: key);

  @override
  _TreatmentListState createState() => _TreatmentListState();
}

class _TreatmentListState extends State<TreatmentList> {
  @override
  Widget build(BuildContext context) {
    print(widget.cId);
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.blue, //s.grey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
            ),
            // child: Text('My Therapies'),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.06,
              //  bottom: MediaQuery.of(context).size.height * 0.06,
            ),
            child: Column(
              children: [
                Text(
                  'My Therapies',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                ),
                FutureBuilder(
                  future: commonBloc.hitGetApi(

                      ///  'https://run.mocky.io/v3/eb5f43d1-0e08-48c1-be04-292dae6b8138'),
                      ApiUrl.treatment_list + '?cs_id=' + widget.cId),
                  builder: (context, AsyncSnapshot snap) {
                    if (snap.data == null) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.74,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      if (snap.data['code'] == 200) {
                        TreatmentList1 treatmentList = treatmentList1FromJson(json.encode(snap.data));
                        if (treatmentList.data.length > 0) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: treatmentList.data.length,
                            itemBuilder: (context, index) {
                              /*return InkWell(
                        onTap: () {
                          */ /*if (treatmentList.data[index].status.toString() == '3') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoctorDetailScreen(
                                        doctorId: treatmentList.data[index].doctorId.toString(),
                                        cId: widget.cId,
                                      ) //OnGoingTreatment(),
                                  ),
                            );
                          } else if (treatmentList.data[index].status.toString() == '2' ||
                              treatmentList.data[index].status.toString() == '1')*/ /* {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OnGoingTreatment(
                                  apId: treatmentList.data[index].bookingId.toString(),
                                ),
                              ),
                            );
                          }
                        },
                        child: */ /*treatmentList.data[index].status.toString() == '3'
                            ?
                        FutureBuilder(
                                future: commonBloc.hitGetApi(ApiUrl.therapist_details +
                                    '?th_id=' +
                                    treatmentList.data[index].doctorId.toString()), //widget.cId),
                                builder: (context, AsyncSnapshot snap) {
                                  if (snap.data == null) {
                                    return Container(
                                      height: MediaQuery.of(context).size.height * 0.3,
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  } else {
                                    TherapistList therapistList = therapistListFromJson(json.encode(snap.data));
                                    return Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      margin: EdgeInsets.only(
                                        top: MediaQuery.of(context).size.height * 0.01,
                                        bottom: MediaQuery.of(context).size.height * 0.01,
                                        left: MediaQuery.of(context).size.width * 0.05,
                                        right: MediaQuery.of(context).size.width * 0.05,
                                      ),
                                      padding: EdgeInsets.only(
                                        top: MediaQuery.of(context).size.height * 0.02,
                                        bottom: MediaQuery.of(context).size.height * 0.02,
                                        left: MediaQuery.of(context).size.width * 0.05,
                                        right: MediaQuery.of(context).size.width * 0.05,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                              width: MediaQuery.of(context).size.width * 0.22,
                                              height: MediaQuery.of(context).size.width * 0.22,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.blue,
                                                  ),
                                                  shape: BoxShape.circle,
                                                  image: new DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: new NetworkImage(
                                                        // "https://th.bing.com/th/id/OIP.hw-Sk04AflX4Te0r8K4R9QAAAA?pid=ImgDet&rs=1"
                                                        'http://iconhomehealth.ca/assets/images/' +
                                                            therapistList.data[0].doctorPhoto,
                                                      )))),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                therapistList.data[0].doctorName, //'Dr. David Gilmour',
                                                style:
                                                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                therapistList.data[0].doctorExp + ' years Experience',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              InkWell(
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width * 0.4,
                                                  decoration: BoxDecoration(
                                                    */ /**/ /*border: Border.all(
                                            color: Colors.blue,
                                          ),*/ /**/ /*
                                                    color: Color(0XFFFFC5DBF4),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      left: MediaQuery.of(context).size.width * 0.02,
                                                      right: MediaQuery.of(context).size.width * 0.02,
                                                      top: MediaQuery.of(context).size.height * 0.008,
                                                      bottom: MediaQuery.of(context).size.height * 0.008,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        therapistList.data[0].doctorType, //'Massage therapist',
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          color: Colors.blue,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => ReviewScreen(
                                                                dId: therapistList.data[0].doctorId,
                                                                cId: widget.cId,
                                                                aId: treatmentList.data[0].bookingId,
                                                              )));
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width * 0.4,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.blue,
                                                    ),
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
                                                        'Leave a Review',
                                                        style: TextStyle(
                                                          color: Colors.blue,
                                                          fontWeight: FontWeight.bold,
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
                                    );
                                  } //do whatever you want
                                },
                              )
                            : */ /*Container(
                                margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.01,
                                  bottom: MediaQuery.of(context).size.height * 0.01,
                                  left: MediaQuery.of(context).size.width * 0.05,
                                  right: MediaQuery.of(context).size.width * 0.05,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.02,
                                  bottom: MediaQuery.of(context).size.height * 0.02,
                                  left: MediaQuery.of(context).size.width * 0.05,
                                  right: MediaQuery.of(context).size.width * 0.05,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      treatmentList.data[index].firstName.toString() +
                                          '\t' + //'John Deo',
                                          treatmentList.data[index].lastName.toString(), //'John Deo',
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      treatmentList.data[index].medications.toString(), //'Physiotherapist',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        */ /*
                                Icon(Icons.add_location_outlined),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.03,
                                ),*/ /*
                                        Expanded(
                                          child: Text(
                                            'bookingTime: ' + treatmentList.data[index].bookingTime.toString(),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      */ /*'Gender: ' +
                                    treatmentList.data[index]['gender'].toString() +
                                    '\t\t' +*/ /*
                                      'DOB: ' + treatmentList.data[index].dob.toString(),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Appointment date: ' + treatmentList.data[index].appointmentDate.toString(),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Medical Conditions: ' + treatmentList.data[index].medicalConditions,
                                    ),
                                    SizedBox(height: 10),
                                    if(treatmentList.data[index].status=='0')
                                    Text(
                                      'Status: Request'),
                                    if(treatmentList.data[index].status=='1')
                                    Text(
                                      'Status: Accept'),
                                    if(treatmentList.data[index].status=='2')
                                    Text(
                                      'Status: Cancel'),
                                    if(treatmentList.data[index].status=='3')
                                    Text(
                                      'Status: Complete'),
                                    */ /*Row(
                              children: [
                                RatingBarIndicator(
                                  //     rating: double.parse(treatmentList.data[index].doctorRatings),
                                  rating: 2.75,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.blue,
                                  ),
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  direction: Axis.horizontal,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(treatmentList.data[index].doctorRatings, ),
                              ],
                            ),*/ /*
                                  ],
                                ),
                              ),
                      );*/
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OnGoingTreatment(
                                        apId: treatmentList.data[index].bookingId,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.01,
                                    bottom: MediaQuery.of(context).size.height * 0.01,
                                    left: MediaQuery.of(context).size.width * 0.05,
                                    right: MediaQuery.of(context).size.width * 0.05,
                                  ),
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.02,
                                    bottom: MediaQuery.of(context).size.height * 0.02,
                                    //left: MediaQuery.of(context).size.width * 0.05,
                                    right: MediaQuery.of(context).size.width * 0.05,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    child: Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          //mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            /*Center(
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                  left: MediaQuery.of(context).size.width * 0.05,
                                                ),
                                                width: MediaQuery.of(context).size.width * 0.20,
                                                height: MediaQuery.of(context).size.width * 0.20,
                                                decoration: new BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.white,
                                                    ),
                                                    shape: BoxShape.circle,
                                                    image: new DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: new NetworkImage(
                                                            "https://th.bing.com/th/id/OIP.hw-Sk04AflX4Te0r8K4R9QAAAA?pid=ImgDet&rs=1")))),
                                          ),*/
                                            /* SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context).size.height * 0.01,
                                                ),
                                                color: Colors.grey,
                                                child: Text(
                                                  'Age: 25M',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),*/
                                          ],
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.07,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              treatmentList.data[index].firstName +
                                                  '\t' +
                                                  treatmentList.data[index].lastName,
                                              //'David Gilmour',
                                              style: TextStyle(
                                                  color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
                                            ),
                                            SizedBox(height: 6),
                                            Text(
                                              'Date of Birth: ' + treatmentList.data[index].dob,
                                            ),
                                            SizedBox(height: 6),
                                            Text(
                                              'Email: ' + treatmentList.data[index].email,
                                            ),
                                            SizedBox(height: 6),
                                            Text(
                                              'Treatment type',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_today_sharp,
                                                  size: 16,
                                                  color: Colors.blue,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context).size.width * 0.025,
                                                ),
                                                Text(
                                                  treatmentList.data[index].appointmentDate +
                                                      '\t|\t' +
                                                      treatmentList.data[index].appointmentTime,
                                                  //'4 Jan 2022 | 5:42 PM',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            if( treatmentList.data[index].status=='0')
                                            Text(
                                              'Treatment Status: Requesting for Appointment',
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                            if( treatmentList.data[index].status=='0')
                                              SizedBox(height: 10),
                                            if( treatmentList.data[index].status=='2')
                                            Text(
                                              'Treatment Status: Request Cancelled',
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                            if( treatmentList.data[index].status=='2')
                                              SizedBox(height: 10),
                                            if( treatmentList.data[index].status=='1')
                                            Text(
                                              'Treatment Status: Appointment Request Acccepted',
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                            if( treatmentList.data[index].status=='1')
                                              SizedBox(height: 10),
                                            if( treatmentList.data[index].status=='3')
                                            Text(
                                              'Treatment Status: Completed',
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                            if( treatmentList.data[index].status=='3')
                                              SizedBox(height: 10),
                                            if( treatmentList.data[index].status=='3')
                                              InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => ReviewScreen(
                                                          dId: treatmentList.data[0].doctorId,
                                                          cId: widget.cId,
                                                          aId: treatmentList.data[0].bookingId,
                                                        )));
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context).size.width * 0.4,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.blue,
                                                  ),
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
                                                      'Leave a Review',
                                                      style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            /*Row(
                                            children: [
                                              InkWell(
                                                onTap: () {

                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
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
                                                        'Confirm',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.025,
                                              ),
                                              InkWell(
                                                onTap: () {

                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.transparent,
                                                    ),
                                                    color: Colors.redAccent,
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
                                                        'Cancel',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),*/
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return Center(child: Text('No treatments History'));
                        }
                      } else if (snap.data['status'] == 'error') {
                        return Center(child: Text('No treatments History'));
                      }
                      return CircularProgressIndicator();
                    } //do whatever you want
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
