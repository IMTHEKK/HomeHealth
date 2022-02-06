import 'package:flutter/material.dart';
import 'package:untitled3/models/therapist_list.dart';
import 'package:untitled3/models/treatment_list.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/screens/doctor_detail.dart';
import 'package:untitled3/screens/patient/ongoing_treatment.dart';
import 'package:untitled3/screens/review.dart';

class TestimonialsList extends StatefulWidget {
  final cId;

  const TestimonialsList({Key? key, this.cId}) : super(key: key);

  @override
  _TestimonialsListState createState() => _TestimonialsListState();
}

class _TestimonialsListState extends State<TestimonialsList> {
  @override
  Widget build(BuildContext context) {
    print(widget.cId);
    return FutureBuilder(
      future: commonBloc.hitGetApi(
          ///  'https://run.mocky.io/v3/eb5f43d1-0e08-48c1-be04-292dae6b8138'),
          ApiUrl.treatment_list + '?cs_id=' + '37'), //widget.cId),
      builder: (context, AsyncSnapshot snap) {
        if (snap.data == null) {
          return Container(
            // height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          TreatmentList treatmentList = TreatmentList.fromJson(snap.data);
          return ListView.builder(
            shrinkWrap: true,
            itemCount: treatmentList.data.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (treatmentList.data[index]['status'].toString() == '1') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OnGoingTreatment(apId: treatmentList.data[index]['booking_id'].toString(),),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DoctorDetailScreen(
                                doctorId: treatmentList.data[index]['doctorID'].toString(),
                                cId: widget.cId,
                              ) //OnGoingTreatment(),
                          ),
                    );
                  }
                },
                child: treatmentList.data[index]['status'].toString() == '0'
                    ? FutureBuilder(
                        future: commonBloc.hitGetApi(ApiUrl.therapist_details +'?th_id='+
                            treatmentList.data[index]['doctorID'].toString()), //widget.cId),
                        builder: (context, AsyncSnapshot snap) {
                          if (snap.data == null) {
                            return Container(
                               height: MediaQuery.of(context).size.height * 0.3,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else {
                            TherapistList therapistList = TherapistList.fromJson(snap.data);
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
                                      decoration: new BoxDecoration(
                                          border: Border.all(
                                            color: Colors.blue,
                                          ),
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: new NetworkImage(
                                                 // "https://th.bing.com/th/id/OIP.hw-Sk04AflX4Te0r8K4R9QAAAA?pid=ImgDet&rs=1"
                                                      'http://iconhomehealth.ca/assets/images/' + therapistList.data[0].doctorPhoto,
                                              )))),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        therapistList.data[0].doctorName,//'Dr. David Gilmour',
                                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        therapistList.data[0].doctorExp+' years Experience',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      InkWell(
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.4,
                                          decoration: BoxDecoration(
                                            /*border: Border.all(
                                      color: Colors.blue,
                                    ),*/
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
                                                therapistList.data[0].doctorType,//'Massage therapist',
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
                                              context, MaterialPageRoute(builder: (context) => ReviewScreen()));
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
                    : Container(
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
                              treatmentList.data[index]['patient_name'].toString(), //'John Deo',
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            SizedBox(height: 10),
                            Text(
                              treatmentList.data[index]['therapy'].toString(), //'Physiotherapist',
                              style: TextStyle(color: Colors.blue),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                /*
                          Icon(Icons.add_location_outlined),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),*/
                                Expanded(
                                  child: Text(
                                    'bookingTime: ' + treatmentList.data[index]['bookingTime'].toString(),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Gender: ' +
                                  treatmentList.data[index]['gender'].toString() +
                                  '\t\t' +
                                  'Age: ' +
                                  treatmentList.data[index]['age'].toString(),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Appointment date: ' + treatmentList.data[index]['appointment_date'].toString(),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Patient Concern: ' + treatmentList.data[index]['patient_concern'].toString(),
                            ),
                            /*Row(
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
                      ),*/
                          ],
                        ),
                      ),
              );
              return Container();
            },
          );
        } //do whatever you want
      },
    );
  }
}
