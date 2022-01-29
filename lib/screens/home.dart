import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled3/models/therapist_list.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/screens/availability_settings.dart';
import 'package:untitled3/screens/doctor_detail.dart';
import 'package:untitled3/screens/ongoing_treatment.dart';
import 'package:untitled3/screens/profile.dart';
import 'package:untitled3/screens/search.dart';
import 'package:untitled3/utilities/shared_preference/get_prefer.dart';

class Home extends StatefulWidget {
  final id;
  const Home({Key? key, this.id}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TabController _tabController;
  var id;

/*  @override
  void initState() {
    GetPreference().getStringValuesSF('id').then((n) {
      id = n.toString();
      print('elkgdrhjsjhrf'+id);
    });
    print('xghdfjgbd'+id);
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    var type = 'Massage Therapy';

    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: SafeArea(
          top: false,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.32,
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
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        /*  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),

                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AvailabilitySettings()));
                              },
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                            ),
                            //  Icon(Icons.)
                          ],
                        ),*/
                        Center(
                          child: Container(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.01,
                            ),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Image.asset('images/IHH_Logo.png'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05,
                            top: MediaQuery.of(context).size.height * 0.03,
                            bottom: MediaQuery.of(context).size.height * 0.02,
                          ),
                          child: Text(
                            'Good morning,', // John Deo',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Center(
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
                                title: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Search therapist, specialities...',
                                      //  contentPadding: EdgeInsets.all(15),
                                      border: InputBorder.none),
                                  onChanged: (value) {},
                                ),
                              )),
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
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.44,
                            child: Card(
                              elevation: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('images/massage _therapy_unselectable.png'),
                                  SizedBox(height: 15),
                                  Text(
                                    'Massage Therapy',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.44,
                              child: Card(
                                color: Colors.blue,
                                elevation: 1,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('images/physiotherapy_selectable.png'),
                                      SizedBox(height: 15),
                                      Text(
                                        'Physiotherapy',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
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
                  FutureBuilder(
                    future: commonBloc.hitGetApi(ApiUrl.therapist_list),
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
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: therapistList.data.length,
                          itemBuilder: (context, index) {
                            //  if (therapistList.data[index].doctorType == type)
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DoctorDetailScreen(
                                          doctorId: therapistList.data[index].doctorId.toString()) //OnGoingTreatment(),
                                      ),
                                );
                              },
                              child: Container(
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
                                      therapistList.data[index].doctorName, //'John Deo',
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      therapistList.data[index].doctorType, //'Physiotherapist',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Icon(Icons.add_location_outlined),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.03,
                                        ),
                                        Expanded(
                                          child: Text(
                                            therapistList.data[index].doctorAddress, /*'MA, New York'*/
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        RatingBarIndicator(
                                          rating: double.parse(therapistList.data[index].doctorRatings),
                                          //2.75,
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
                                        Text(
                                          therapistList.data[index].doctorRatings, /*'9.7'*/
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
                      } //do whatever you want
                    },
                  ),
                ],
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
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: null,
                        ),
                      ),
                    ),
                    //  Icon(Icons.)
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
