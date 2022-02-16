import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled3/models/therapist_list.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/screens/doctor_detail.dart';
import 'package:untitled3/screens/search.dart';
import 'package:untitled3/screens/search_doctor.dart';
import 'package:geolocator/geolocator.dart';

class SearchPage1 extends StatefulWidget {
  final cId, name;

  const SearchPage1({Key? key, this.cId, this.name}) : super(key: key);

  @override
  State<SearchPage1> createState() => _SearchPage1State();
}

class _SearchPage1State extends State<SearchPage1>
    with SingleTickerProviderStateMixin {
  var scrollController;
  var _tabController;
  late double _latitude; //= 10.750492; // = 12.916983;
  late double _longitude;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      setState(() {});
    });
    //getLatLong();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45),
                          bottomRight: Radius.circular(45),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  //Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(),
                                ),
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Image.asset('images/IHH_Logo.png'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(),
                              ),
                              //  Icon(Icons.)
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05,
                            top: MediaQuery.of(context).size.height * 0.02,
                            bottom: MediaQuery.of(context).size.height * 0.02,
                          ),
                          child: Text(
                            'Hello, ' + widget.name,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchDoctor(
                                          cId: widget.name,
                                          type: ApiUrl.therapist_list +
                                              '?location=',
                                        )));
                          },
                          child: Center(
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  //  border: Border.all(
                                  //    width: 1, /*color: Colors.purple, */style: BorderStyle.solid),
                                ),
                                child: ListTile(
                                  horizontalTitleGap: 0,
                                  leading: Icon(Icons.search),
                                  title: Text(
                                    /*Field(
                                    decoration: InputDecoration(
                                        hintText: */
                                    'Search therapist, specialities...',
                                    //  contentPadding: EdgeInsets.all(15),
                                    /*        border: InputBorder.none),
                                    onChanged: (value) {},
                                */
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.05,
                          left: MediaQuery.of(context).size.width * 0.05,
                        ),
                        child: Text(
                          'Book a Service',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0XFFF4F4F5)),
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: TabBar(
                      labelPadding: EdgeInsets.all(0),
                      physics: ClampingScrollPhysics(),
                      controller: _tabController,
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue),
                      tabs: [
                        Container(
                          margin: EdgeInsets.all(0),
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.14,
                                    child: Image.asset(
                                      'images/massage _therapy_unselectable.png',
                                      color: _tabController.index == 0
                                          ? Colors.white
                                          : Colors.black,
                                    )),
                                Text(
                                  "Massage Therapy", //Components
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(0),
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.14,
                                  child: Image.asset(
                                    'images/physiotherapy_selectable.png',
                                    color: _tabController.index == 1
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                Text(
                                  "Physiotherapy", //Components
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.05,
                          left: MediaQuery.of(context).size.width * 0.05,
                        ),
                        child: Text(
                          'Top Rated in Your Area',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchPage(
                                        name: widget.name,
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.05,
                            right: MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Text(
                            'See All',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ];
        },
        body: FutureBuilder(
          future: getLatLong(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(child: CircularProgressIndicator()),
              );
            } else {
              return TabBarView(
                controller: _tabController,
                children: <Widget>[
                  FutureBuilder(
                    future: commonBloc.hitGetApi(ApiUrl.therapist_list +
                        "?latitude=$_latitude&longitude=$_longitude"),
                    builder: (context, AsyncSnapshot snap) {
                      if (snap.data == null) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        if (snap.data["status"] == "200") {
                          TherapistList therapistList =
                              TherapistList.fromJson(snap.data);
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: therapistList.data.length,
                            itemBuilder: (context, index) {
                              if (therapistList.data[index].doctorType ==
                                  'Massage Therapy')
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DoctorDetailScreen(
                                                doctorId: therapistList
                                                    .data[index].doctorId,
                                                cId: widget.cId,
                                              ) //OnGoingTreatment(),
                                          ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.01,
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                      left: MediaQuery.of(context).size.width *
                                          0.05,
                                      right: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.02,
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      left: MediaQuery.of(context).size.width *
                                          0.05,
                                      right: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          therapistList.data[index].doctorName,
                                          //'John Deo',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          therapistList.data[index].doctorType,
                                          //'Physiotherapist',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Icon(Icons.add_location_outlined),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03,
                                            ),
                                            Expanded(
                                              child: Text(
                                                therapistList.data[index]
                                                    .doctorAddress, /*'MA, New York'*/
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            RatingBarIndicator(
                                              rating: double.parse(therapistList
                                                  .data[index].doctorRatings),
                                              //2.75,
                                              itemBuilder: (context, index) =>
                                                  Icon(
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
                                            Text(
                                              therapistList.data[index]
                                                  .doctorRatings, /*'9.7'*/
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              return Container();
                            },
                          );
                        } else {
                          return Center(
                            child: Container(
                              child: Text(
                                snap.data["message"],
                              ),
                            ),
                          );
                        }
                      }
                    },
                  ),
                  FutureBuilder(
                    future: commonBloc.hitGetApi(ApiUrl.therapist_list +
                        "?latitude=$_latitude&longitude=$_longitude"),
                    builder: (context, AsyncSnapshot snap) {
                      if (snap.data == null) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        if (snap.data["status"] == "200") {
                          TherapistList therapistList1 =
                              TherapistList.fromJson(snap.data);
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: therapistList1.data.length,
                            itemBuilder: (context, index) {
                              if (therapistList1.data[index].doctorType ==
                                  "Physiotherapy")
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DoctorDetailScreen(
                                              doctorId: therapistList1
                                                  .data[index]
                                                  .doctorId) //OnGoingTreatment(),
                                          ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.01,
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                      left: MediaQuery.of(context).size.width *
                                          0.05,
                                      right: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.02,
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      left: MediaQuery.of(context).size.width *
                                          0.05,
                                      right: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          therapistList1.data[index].doctorName,
                                          //'John Deo',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          therapistList1.data[index].doctorType,
                                          //'Physiotherapist',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Icon(Icons.add_location_outlined),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03,
                                            ),
                                            Expanded(
                                              child: Text(
                                                therapistList1.data[index]
                                                    .doctorAddress, /*'MA, New York'*/
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            RatingBarIndicator(
                                              rating: double.parse(
                                                  therapistList1.data[index]
                                                      .doctorRatings),
                                              //2.75,
                                              itemBuilder: (context, index) =>
                                                  Icon(
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
                                            Text(
                                              therapistList1.data[index]
                                                  .doctorRatings, /*'9.7'*/
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              return Container();
                            },
                          );
                        } else {
                          return Center(
                            child: Container(
                              child: Text(
                                snap.data["message"],
                              ),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future getLatLong() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission.name == "denied") {
      LocationPermission permission = await Geolocator.requestPermission();
    } else if (permission.name == "deniedForever") {
      LocationPermission permission = await Geolocator.requestPermission();
    } else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _latitude = position.latitude;
      _longitude = position.longitude;
      return "fetched";
    }
  }

/*  getCurrentLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    print("_serviceEnabled $_serviceEnabled");
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      print("_serviceEnabled $_serviceEnabled");
      if (!_serviceEnabled) {
        showMyDialog(context, "Location Not Enable", "Please enable location to continue app", false);
        return false;
      }
    }

    _permissionGranted = await location.hasPermission();
    print("permission ${_permissionGranted}");
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      print("re permission ${_permissionGranted}");
      if (_permissionGranted == PermissionStatus.denied) {
        showMyDialog(context, "Accept Location Permission", "Please accept location permission to continue app", false);
        return false;
      } else if (_permissionGranted == PermissionStatus.deniedForever) {
        showMyDialog(context, "Accept Location Permission",
            "Please enable location permission from setting to continue app", true);
        return false;
      }
    } else if (_permissionGranted == PermissionStatus.deniedForever) {
      showMyDialog(context, "Accept Location Permission",
          "Please enable location permission from setting to continue app", true);
      return false;
    }
    _locationData = await location.getLocation();
    if ((_latitude == null) || (_longitude == null) && ((_locationData != null))) {
      _latitude = _locationData.latitude!;
      _longitude = _locationData.longitude!;
    }
  }

  void showMyDialog(BuildContext context, String title, String message, bool isOnlyOk) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
                child: Text("Ok"),
                onPressed: () {
                  if (!isOnlyOk) {
                    Navigator.pop(context);
                    //setState(() {});
                  } else {
                    if (Platform.isAndroid) {
                      SystemNavigator.pop();
                    } else if (Platform.isIOS) {
                      exit(0);
                    }
                  }
                }),
            isOnlyOk
                ? Container()
                : TextButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      if (Platform.isAndroid) {
                        SystemNavigator.pop();
                      } else if (Platform.isIOS) {
                        exit(0);
                      }
                    }),
          ],
        );
      },
    );
  }*/
}
