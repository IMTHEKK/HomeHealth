import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled3/models/treatment_list1.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/screens/doctor/therapies_details_screens.dart';
import 'package:untitled3/screens/patient/ongoing_treatment.dart';
import 'package:untitled3/screens/patient/review.dart';
import 'package:untitled3/utilities/utils.dart';

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
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: treatmentList.data.length,
                            itemBuilder: (context, position) {
                              return InkWell(
                                onTap: () {
                                 /* if (treatmentList.data[0].status == '0') {
                                    //no click
                                  } else {*/
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TherpiesDetailsScreen(
                                          apId: treatmentList.data[position].bookingId,
                                          type: '0',
                                        ),
                                      ),
                                    );
                                 // }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.transparent,
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
                                        /*Column(
                                            //mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Center(
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
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context).size.height * 0.01,
                                              ),
                                            ],
                                          ),*/
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.07,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              treatmentList.data[position].firstName +
                                                  " " +
                                                  treatmentList.data[position].lastName,
                                              style: TextStyle(
                                                  color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context).size.height * 0.01, left: 5),
                                              // color: Colors.grey,
                                              child: Text(
                                                'DOB: ' + treatmentList.data[position].dob,
                                                // style: TextStyle(
                                                //   color: Colors.white,
                                                // ),
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
                                                  treatmentList.data[position].appointmentDate +
                                                      " | " +
                                                      treatmentList.data[position].appointmentTime,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            treatmentList.data[position].status == '0'
                                                ? Row(
                                              children: [
                                                Container(
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
                                                        'Requesting for Appointment',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                                : Container(),
                                            treatmentList.data[position].status == '2'
                                                ? Container(
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
                                                    'Cancelled',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                                : Container(),
                                            treatmentList.data[position].status == '1'
                                                ? Container(
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
                                                    'Accepted',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                                : Container(),
                                            treatmentList.data[position].status == '3'
                                                ? Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.transparent,
                                                ),
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
                                                    'Completed',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                                : Container(),
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
