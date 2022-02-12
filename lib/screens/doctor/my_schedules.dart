import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:untitled3/models/schedule.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/utilities/utils.dart';

class MySchedules extends StatefulWidget {
  final dId;

  const MySchedules({Key? key, this.dId}) : super(key: key);

  @override
  _MySchedulesState createState() => _MySchedulesState();
}

class _MySchedulesState extends State<MySchedules> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode =
      RangeSelectionMode.toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  bool isVisible = false;
  late Map<DateTime, List> events;
  late List selectedEvents;
  bool isSlot1 = false;
  bool isSlot2 = false;
  bool isSlot3 = false;
  bool isSlot4 = false;

  //late MySchedule mySchedule;

  Future<void> _onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _focusedDay = focusedDay;
        _selectedDay = selectedDay;
      });
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                    height: MediaQuery.of(context).size.height * 0.25,
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
                                  top: MediaQuery.of(context).size.height * 0.06,
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
                                  top: MediaQuery.of(context).size.width * 0.06,
                                ),
                                // alignment: Alignment.center,
                                child: Text(
                                  'Availability Settings',
                                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 22),
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
                      top: MediaQuery.of(context).size.height * 0.09,
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
                                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.07,
                                    right: MediaQuery.of(context).size.width * 0.07,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Select Date and Time',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
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
                                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                /*Padding(
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
                                ),*/
                                TableCalendar(
                                  firstDay: DateTime.now(),
                                  lastDay: DateTime.utc(2030, 3, 14),
                                  focusedDay: _focusedDay,
                                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                                  rangeStartDay: _rangeStart,
                                  rangeEndDay: _rangeEnd,
                                  calendarFormat: _calendarFormat,
                                  rangeSelectionMode: _rangeSelectionMode,
                                  startingDayOfWeek: StartingDayOfWeek.monday,
                                  calendarStyle: CalendarStyle(
                                    // Use `CalendarStyle` to customize the UI
                                    outsideDaysVisible: false,
                                  ),
                                  onDaySelected: _onDaySelected,
                                  onRangeSelected: _onRangeSelected,
                                  onFormatChanged: (format) {
                                    if (_calendarFormat != format) {
                                      setState(() {
                                        _calendarFormat = format;
                                      });
                                    }
                                  },
                                  onPageChanged: (focusedDay) {
                                    _focusedDay = focusedDay;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                        FutureBuilder(
                          future: commonBloc.hitGetApi(
                              // 'https://run.mocky.io/v3/88012a3b-5912-4421-9e6d-6a11b8af8a94'
                              'https://run.mocky.io/v3/007eaa97-07cb-4336-a92c-bc832158d8b9'),
                          builder: (context, AsyncSnapshot snap) {
                            if (snap.data == null) {
                              return Container(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else {
                              MySchedule mySchedule = myScheduleFromJson(json.encode(snap.data));
                              return Card(
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
                                            padding: EdgeInsets.only(
                                              left: MediaQuery.of(context).size.width * 0.3,
                                              right: MediaQuery.of(context).size.width * 0.05,
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      DateFormat("yMMMMd").format(_selectedDay!),
                                                      // '1st JANUARY 2022',
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
                                                  height: 24,
                                                  width: 24,
                                                  child: SvgPicture.asset(
                                                    'images/add_time_slot.svg',
                                                    color: Colors.blue,
                                                    //   semanticsLabel: 'Acme Logo'
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                          Container(
                                            height: MediaQuery.of(context).size.height * 0.05,
                                            /*child: ListView.builder(
                                              //shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: mySchedule.data[0].slotsJson.length,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  height: MediaQuery.of(context).size.height * 0.05,
                                                  child: Row(
                                                    //  scrollDirection: Axis.horizontal,
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                          left: MediaQuery.of(context).size.width * 0.03,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          color: Color(0xffDAF3FF),
                                                          border: Border.all(
                                                            color: Colors.blue,
                                                          ),
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
                                                              mySchedule.data[0].slotsJson[index].startTime +
                                                                  '-' +
                                                                  mySchedule.data[0].slotsJson[index].endTime,
                                                              //'09:00-12:00',
                                                              style: TextStyle(
                                                                fontSize: 9,
                                                                color: Colors.blue,
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      */ /*Container(
                                                    margin: EdgeInsets.only(
                                                      left: MediaQuery.of(context).size.width * 0.01,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffDAF3FF),
                                                      border: Border.all(
                                                        color: Colors.blue,
                                                      ),
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
                                                          '12:00-15:00',
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
                                                      left: MediaQuery.of(context).size.width * 0.01,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffDAF3FF),
                                                      border: Border.all(
                                                        color: Colors.blue,
                                                      ),
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
                                                          '15:00-18:00',
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
                                                      left: MediaQuery.of(context).size.width * 0.01,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffDAF3FF),
                                                      border: Border.all(
                                                        color: Colors.blue,
                                                      ),
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
                                                          '18:00-21:00',
                                                          style: TextStyle(
                                                            fontSize: 9,
                                                            color: Colors.blue,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),*/ /*
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),*/
                                            child: Container(
                                              height: MediaQuery.of(context).size.height * 0.05,
                                              child: Row(
                                                //  scrollDirection: Axis.horizontal,
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        isSlot1 = !isSlot1;
                                                      });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                        left: MediaQuery.of(context).size.width * 0.03,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: isSlot1 ? Color(0xffDAF3FF) : Colors.white,
                                                        border: Border.all(
                                                          color: Colors.blue,
                                                        ),
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
                                                            '09:00-12:00',
                                                            style: TextStyle(
                                                              fontSize: 9,
                                                              color: Colors.blue,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        isSlot2 = !isSlot2;
                                                      });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                        left: MediaQuery.of(context).size.width * 0.01,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: isSlot2 ? Color(0xffDAF3FF) : Colors.white,
                                                        border: Border.all(
                                                          color: Colors.blue,
                                                        ),
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
                                                            '12:00-15:00',
                                                            style: TextStyle(
                                                              fontSize: 9,
                                                              color: Colors.blue,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        isSlot3 = !isSlot3;
                                                      });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                        left: MediaQuery.of(context).size.width * 0.01,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: isSlot3 ? Color(0xffDAF3FF) : Colors.white,
                                                        border: Border.all(
                                                          color: Colors.blue,
                                                        ),
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
                                                            '15:00-18:00',
                                                            style: TextStyle(
                                                              fontSize: 9,
                                                              color: Colors.blue,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        isSlot4 = !isSlot4;
                                                      });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                        left: MediaQuery.of(context).size.width * 0.01,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: isSlot4 ? Color(0xffDAF3FF) : Colors.white,
                                                        border: Border.all(
                                                          color: Colors.blue,
                                                        ),
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
                                                            '18:00-21:00',
                                                            style: TextStyle(
                                                              fontSize: 9,
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
                                            ),
                                          ),
                                          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            margin: EdgeInsets.only(
                                              left: MediaQuery.of(context).size.width * 0.2,
                                              right: MediaQuery.of(context).size.width * 0.2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xff0098db),
                                              border: Border.all(
                                                color: Colors.transparent,
                                              ),
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: InkWell(
                                              onTap: () async {
                                                isVisible = true;
                                                setState(() {});
                                                Map<String, dynamic> params = {
                                                  'doctor_id': widget.dId,
                                                  'schedules': [
                                                    {
                                                      "schedule_date": DateFormat('yyyy-MM-dd').format(_selectedDay!),
                                                      "slots_json": [
                                                        if (isSlot1)
                                                          {
                                                            "start_time": "09:00",
                                                            "end_time": "12:00",
                                                            "is_disabled": false
                                                          },
                                                        if (isSlot2)
                                                          {
                                                            "start_time": "12:00",
                                                            "end_time": "15:00",
                                                            "is_disabled": false
                                                          },
                                                        if (isSlot3)
                                                          {
                                                            "start_time": "15:00",
                                                            "end_time": "18:00",
                                                            "is_disabled": false
                                                          },
                                                        if (isSlot4)
                                                          {
                                                            "start_time": "18:00",
                                                            "end_time": "21:00",
                                                            "is_disabled": false
                                                          },
                                                      ]
                                                    }
                                                  ]
                                                };
                                                print('Params: ' + params.toString());
                                                var res = await commonBloc.hitPostApi(
                                                    params, ApiUrl.create_therapist_schedule);
                                                if (res['code'] == 200) {
                                                  Utils.showToast(context, '${res['message']}');
                                                  Navigator.pop(context);
                                                } else if (res['code'] == 400) {
                                                  Utils.showToast(context, '${res['validation-errors']}');
                                                } else {
                                                  Utils.showToast(context, 'Schedule update failed');
                                                }
                                                isVisible = false;
                                                setState(() {});
                                              },
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
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.06,
                                    ),
                                  ],
                                ),
                              );
                            } //do whatever you want
                          },
                        ),
                      ],
                    ),
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

Widget _getEventsForDay(DateTime day) {
  return Text('jvgjgjyv');
}
