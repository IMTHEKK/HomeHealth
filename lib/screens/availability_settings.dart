import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';

class AvailabilitySettings extends StatefulWidget {
  const AvailabilitySettings({Key? key}) : super(key: key);

  @override
  _AvailabilitySettingsState createState() => _AvailabilitySettingsState();
}

class _AvailabilitySettingsState extends State<AvailabilitySettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, //Colors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                    color: Color(0xfff7f7f7), //s.grey,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    )),
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
                              left: MediaQuery.of(context).size.width * 0.1,
                              top: 8,
                            ),
                            // alignment: Alignment.center,
                            child: Text(
                              'Availability Settings',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.06,
                  left: MediaQuery.of(context).size.width * 0.04,
                  right: MediaQuery.of(context).size.width * 0.04,
                  bottom: MediaQuery.of(context).size.width * 0.04,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.transparent)),
                      color: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.07,
                                right: MediaQuery.of(context).size.width * 0.07,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Select Date and Time',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  Container(
                                    height: 24,
                                    width: 24,
                                    child: SvgPicture.asset(
                                      'images/calendar_time_slot.svg',
                                      color: Colors.blue,
                                      //semanticsLabel: 'A red up arrow'
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.07,
                                right: MediaQuery.of(context).size.width * 0.07,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'January 2022',
                                  ),
                                ],
                              ),
                            ),
                            TableCalendar(
                              firstDay: DateTime.utc(2010, 10, 16),
                              lastDay: DateTime.utc(2030, 3, 14),
                              focusedDay: DateTime.now(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Card(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            /*margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.2,
                              right: MediaQuery.of(context).size.width * 0.2,
                            ),*/
                            // height: MediaQuery.of(context).size.height * 0.06,
                            child: Column(
                              children: [
                                Container(
                                  padding:EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width*0.3,
                                    right: MediaQuery.of(context).size.width*0.05,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            '1st JANUARY 2022',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'set your time table',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                              //   fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height:24 ,
                                        width:24 ,
                                        child: SvgPicture.asset(
                                          'images/add_time_slot.svg',
                                          color: Colors.blue,
                                          //   semanticsLabel: 'Acme Logo'
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  child: Row(
                                  //  scrollDirection: Axis.horizontal,
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xffDAF3FF),
                                          border: Border.all(
                                            color: Colors.blue,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.008,
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.008,
                                          ),
                                          child: Center(
                                            child: Text(
                                              '09:00 AM - 12:00PM',
                                              style: TextStyle(
                                                fontSize: 9,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xffDAF3FF),
                                          border: Border.all(
                                            color: Colors.blue,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.008,
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.008,
                                          ),
                                          child: Center(
                                            child: Text(
                                              '12:00 PM - 03:00PM',
                                              style: TextStyle(
                                                fontSize: 9,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xffDAF3FF),
                                          border: Border.all(
                                            color: Colors.blue,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.008,
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.008,
                                          ),
                                          child: Center(
                                            child: Text(
                                              '03:00 PM - 06:00PM',
                                              style: TextStyle(
                                                fontSize: 9,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                    8,
                                  ),
                                  margin: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * 0.2,
                                    right:
                                        MediaQuery.of(context).size.width * 0.2,
                                  ),
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
                                          "update".toUpperCase(),
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
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
