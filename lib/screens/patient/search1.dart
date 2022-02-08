import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled3/models/therapist_list.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/screens/doctor_detail.dart';
import 'package:untitled3/screens/search.dart';

class SearchPage1 extends StatefulWidget {
  final cId, name;

  const SearchPage1({Key? key, this.cId,this.name}) : super(key: key);

  @override
  State<SearchPage1> createState() => _SearchPage1State();
}

class _SearchPage1State extends State<SearchPage1> with SingleTickerProviderStateMixin {
  var scrollController;
  var _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      setState(() {});
    });
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
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
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
                                    top: MediaQuery.of(context).size.height * 0.02,
                                  ),
                                  width: MediaQuery.of(context).size.width * 0.5,
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
                            'Hello, '+widget.name,
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
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color(0XFFF4F4F5)),
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
                      indicator: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.blue),
                      tabs: [
                        Container(
                          margin: EdgeInsets.all(0),
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                    height: MediaQuery.of(context).size.height * 0.14,
                                    child: Image.asset(
                                      'images/massage _therapy_unselectable.png',
                                      color: _tabController.index == 0 ? Colors.white : Colors.black,
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
                                  height: MediaQuery.of(context).size.height * 0.14,
                                  child: Image.asset(
                                    'images/physiotherapy_selectable.png',
                                    color: _tabController.index == 1 ? Colors.white : Colors.black,
                                  ),
                                ),
                                Text(
                                  "Psychotherapist", //Components
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(name: widget.name,)));
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
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
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
                      if (therapistList.data[index].doctorType == 'Massage Therapy')
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoctorDetailScreen(
                                        doctorId: therapistList.data[index].doctorId,
                                    cId: widget.cId,
                                      ) //OnGoingTreatment(),
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
                }
              },
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
                  TherapistList therapistList1 = TherapistList.fromJson(snap.data);
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: therapistList1.data.length,
                    itemBuilder: (context, index) {
                      if (therapistList1.data[index].doctorType == "Psychotherapist")
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoctorDetailScreen(
                                      doctorId: therapistList1.data[index].doctorId) //OnGoingTreatment(),
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
                                  therapistList1.data[index].doctorName, //'John Deo',
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  therapistList1.data[index].doctorType, //'Physiotherapist',
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
                                        therapistList1.data[index].doctorAddress, /*'MA, New York'*/
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    RatingBarIndicator(
                                      rating: double.parse(therapistList1.data[index].doctorRatings),
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
                                      therapistList1.data[index].doctorRatings, /*'9.7'*/
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
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
