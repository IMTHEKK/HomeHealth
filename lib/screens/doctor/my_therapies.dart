import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:untitled3/models/my_therapies_model.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/screens/doctor/therapies_details_screens.dart';
import 'package:untitled3/utilities/utils.dart';

class MyTherapies extends StatefulWidget {
  final id;

  const MyTherapies({Key? key, this.id}) : super(key: key);

  @override
  _MyTherapiesState createState() => _MyTherapiesState();
}

class _MyTherapiesState extends State<MyTherapies> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              top: false,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      color: Color(0xfff7f7f7), //s.grey,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.05,
                                    top: 20,
                                  ),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.18,
                                    top: 5,
                                  ),
                                  // alignment: Alignment.center,
                                  child: Text(
                                    'My Therapies',
                                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 22),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2,
                    ),
                    child: FutureBuilder(
                      future: commonBloc.hitGetApi(

                          ///  'https://run.mocky.io/v3/eb5f43d1-0e08-48c1-be04-292dae6b8138'),
                          /// 'https://run.mocky.io/v3/89a5c985-6a76-4c80-84d5-f3583babab36',
                          ApiUrl.treatment_list + '?th_id=' + widget.id.toString()),
                      //widget.cId),
                      builder: (context, AsyncSnapshot snap) {
                        if (snap.data == null) {
                          return Container(
                            // height: MediaQuery.of(context).size.height * 0.3,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else {
                          if (snap.data['code'] == 200) {
                            MyTherapiesModel treatmentList = MyTherapiesModel.fromJson(snap.data);
                            return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: treatmentList.data.length,
                              itemBuilder: (context, position) {
                                return InkWell(
                                  onTap: () {
                                    if (treatmentList.data[0].status == '0') {
                                      //no click
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TherpiesDetailsScreen(
                                            apId: treatmentList.data[position].bookingId,
                                          ),
                                        ),
                                      );
                                    }
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
                                                  'DOB: '+treatmentList.data[position].dob,
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
                                                        InkWell(
                                                          onTap: () async {
                                                            isVisible = true;
                                                            setState(() {});
                                                            Map<String, dynamic> params = {
                                                              'appointment_id': treatmentList.data[position].bookingId,
                                                              'status': '1',
                                                            };
                                                            var res = await commonBloc.hitPostApi(
                                                                params, ApiUrl.update_appointment_details);
                                                            if (res['code'] == 200) {
                                                              Utils.showToast(
                                                                  context, '${res['status']} : ${res['message']}');
                                                            } else if (res['code'] == 400) {
                                                              Utils.showToast(context,
                                                                  '${res['status']} : ${res['validation-errors']}');
                                                            } else {
                                                              Utils.showToast(context,
                                                                  '${res['status']} : ${res['validation-errors']}');
                                                            }
                                                            isVisible = false;
                                                            setState(() {});
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
                                                          onTap: () async {
                                                            isVisible = true;
                                                            setState(() {});
                                                            Map<String, dynamic> params = {
                                                              'appointment_id': treatmentList.data[position].bookingId,
                                                              'status': '2',
                                                            };
                                                            var res = await commonBloc.hitPostApi(
                                                                params, ApiUrl.update_appointment_details);
                                                            if (res['code'] == 200) {
                                                              Utils.showToast(
                                                                  context, '${res['status']} : ${res['message']}');
                                                            } else if (res['code'] == 400) {
                                                              Utils.showToast(context,
                                                                  '${res['status']} : ${res['validation-errors']}');
                                                            } else {
                                                              Utils.showToast(context,
                                                                  '${res['status']} : ${res['validation-errors']}');
                                                            }
                                                            isVisible = false;
                                                            setState(() {});
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
                            return Center(
                              child: Text(
                                "No Therapies Available",
                              ),
                            );
                          }
                        } //do whatever you want
                      },
                    ),
                  ),
                ],
              ),
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
    );
  }
}
