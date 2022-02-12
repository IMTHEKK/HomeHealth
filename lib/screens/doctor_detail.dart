import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled3/models/customers.dart';
import 'package:untitled3/models/testimonial_list.dart';
import 'package:untitled3/models/therapist_details.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/screens/patient/appointment_form1.dart';
import 'package:untitled3/screens/patient/see_all_reviews.dart';

class DoctorDetailScreen extends StatefulWidget {
  final doctorId;
  final cId;

  const DoctorDetailScreen({Key? key, this.doctorId, this.cId})
      : super(key: key);

  @override
  _DoctorDetailScreenState createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white70,
      body: FutureBuilder(
        future: commonBloc
            .hitGetApi(ApiUrl.therapist_details + "?th_id=" + widget.doctorId),
        builder: (context, AsyncSnapshot snap) {
          if (snap.data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            TherapistDetails therapistDetails =
                TherapistDetails.fromJson(snap.data);
            return SingleChildScrollView(
              child: SafeArea(
                top: false,
                child: /*Container(
                  height: MediaQuery.of(context).size.height * 0.88,
                  child:*/
                    Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(45),
                            bottomRight: Radius.circular(45),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Row(
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(),
                              ),
                              //  Icon(Icons.)
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.1,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  therapistDetails.data[0].doctorName,
                                  //'Aaron J. Hogan',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  therapistDetails.data[0].doctorType,
                                  //'Psychotherapist',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SeeAllReviews(dId: widget.doctorId),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Text('* * * * *'),
                                  RatingBarIndicator(
                                    rating: double.parse(therapistDetails
                                        .data[0].doctorRatings),
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Colors.blue,
                                    ),
                                    itemCount: 5,
                                    itemSize: 20.0,
                                    direction: Axis.horizontal,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'See all comments',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.07,
                        // right: MediaQuery.of(context).size.width * 0.4,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.78,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    therapistDetails.data[0]
                                        .doctorAddress, /*'MA, New York'*/
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015),
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.6,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.29,
                            decoration: BoxDecoration(
                              // border: Border.all(
                              color: Colors.blue,
                              //),

                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.04,
                                right: MediaQuery.of(context).size.width * 0.04,
                                top: MediaQuery.of(context).size.height * 0.008,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.008,
                              ),
                              child: Center(
                                child: Text(
                                  therapistDetails.data[0].doctorExp +
                                      ' years\nExperience',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.025),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            decoration: BoxDecoration(
                              color: Color(0xff91AFD9),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.04,
                                right: MediaQuery.of(context).size.width * 0.04,
                                top: MediaQuery.of(context).size.height * 0.008,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.008,
                              ),
                              child: Center(
                                child: Text(
                                  therapistDetails.data[0].totalPatients +
                                      '\nPatients',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.1,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: /*Container(
                                margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.01,
                                  left: MediaQuery.of(context).size.width * 0.07,
                                  right: MediaQuery.of(context).size.width * 0.1,
                                ),
                                child:*/
                                Text(
                              therapistDetails.data[0]
                                  .description, //'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
                              // ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        bottom: MediaQuery.of(context).size.height * 0.03,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07,
                      ),
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  // AppointmentForm(dId: therapistDetails.data[0].doctorId, cId: widget.cId),
                                  AppointmentForm1(
                                      dId: therapistDetails.data[0].doctorId,
                                      cId: widget.cId),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: <Color>[
                                    Color(0xff8db8e1),
                                    Color(0xff1a9cdb)
                                  ])),
                          /*decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),*/
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  "Make an Appointment",
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
                   /* FutureBuilder(
                      future: commonBloc.hitGetApi(ApiUrl.get_testimonial_list +
                          '?doctor_id=' +
                          widget.doctorId),
                      builder: (context, AsyncSnapshot snap) {
                        if (snap.data == null) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          if (snap.data['code'] == 200) {
                            Testimonials testimonialsList =
                                testimonialsFromJson(json.encode(snap.data));
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: testimonialsList.data.length,
                              itemBuilder: (context, index) {
                                return FutureBuilder(
                                  future: commonBloc.hitGetApi(ApiUrl
                                          .view_profile +
                                      '?cs_id=' +
                                      testimonialsList.data[index].customerId
                                          .toString()),
                                  builder: (context, AsyncSnapshot sn) {
                                    if (sn.data == null) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      if (snap.data['code'] == 200) {
                                        Customer customer = customerFromJson(
                                            json.encode(sn.data));
                                        return Container(
                                          margin: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                          ),
                                          padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.22,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.22,
                                                  decoration: new BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.blue,
                                                      ),
                                                      shape: BoxShape.circle,
                                                      image: new DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: new NetworkImage(
                                                            //  "https://th.bing.com/th/id/OIP.hw-Sk04AflX4Te0r8K4R9QAAAA?pid=ImgDet&rs=1"
                                                            'http://iconhomehealth.ca/assets/images/' +
                                                                customer.data[0]
                                                                    .customerPhoto,
                                                          )))),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  RatingBarIndicator(
                                                    rating: double.parse(
                                                        testimonialsList
                                                            .data[0].ratings
                                                            .toString()),
                                                    itemBuilder:
                                                        (context, index) =>
                                                            Icon(
                                                      Icons.star,
                                                      color: Colors.blue,
                                                    ),
                                                    itemCount: 5,
                                                    itemSize: 20.0,
                                                    direction: Axis.horizontal,
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    testimonialsList
                                                        .data[0].comments,
                                                    //'Dr. David Gilmour',
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                  SizedBox(height: 10),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'Reviewed by: ' +
                                                                customer.data[0]
                                                                    .customerName,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    testimonialsList
                                                        .data[0].createdAt,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        return Text('error');
                                      }
                                    } //do whatever you want
                                  },
                                );
                              },
                            );
                          } else {
                            return Container(
                              margin: EdgeInsets.only(
                                bottom: MediaQuery.of(context).size.height * 0.03,
                              ),
                              child: Text(
                                snap.data['validation-errors'],
                              ),
                            );
                          }
                        } //do whatever you want
                      },
                    ),*/
                  ],
                ),
                //),
              ),
            );
          } //do whatever you want
        },
      ),
    );
  }
}
