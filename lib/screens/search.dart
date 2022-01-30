import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled3/models/therapist_list.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/screens/availability_settings.dart';
import 'package:untitled3/screens/doctor_detail.dart';

class SearchPage extends StatefulWidget {
  final cId;

  const SearchPage({Key? key, this.cId}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {
  var scrollController;
  var _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
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
                        /*SizedBox(
                      height: MediaQuery.of(context).size.height*0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                        //  Icon(Icons.)
                      ],
                    ),*/
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                  ),
                                  onPressed: null,
                                ),
                              ),
                              //  Icon(Icons.)
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05,
                            // top: MediaQuery.of(context).size.height * 0.03,
                            bottom: MediaQuery.of(context).size.height * 0.02,
                          ),
                          child: Text(
                            'Welcome, John Deo',
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
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50), color: Color(0XFFF4F4F5)),
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
                          borderRadius: BorderRadius.circular(50), color: Colors.blue),
                      tabs: [
                        Tab(
                          child: Container(
                            margin: EdgeInsets.all(0),
                            child: Center(
                              child: Text(
                                "All", //Components
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Align(
                              alignment: Alignment.center,
                              child: Center(
                                child: Text(
                                  "Top Rated",
                                ),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Align(
                              alignment: Alignment.center,
                              child: Center(
                                child: Text(
                                  "Best Reviews",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                      child: Text('Loading...'),
                    ),
                  );
                } else {
                  TherapistList therapistList = TherapistList.fromJson(snap.data);
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: therapistList.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorDetailScreen(
                                    doctorId: therapistList.data[index].doctorId,
                                cId: widget.cId,) //OnGoingTreatment(),
                            ),
                          );
                        },
                        child: Container(
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
                          child: Container(
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
                                              'http://iconhomehealth.ca/assets/images/' +
                                                  therapistList.data[0].doctorPhoto,
                                              //    "https://th.bing.com/th/id/OIP.hw-Sk04AflX4Te0r8K4R9QAAAA?pid=ImgDet&rs=1"
                                            )))),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      therapistList.data[index].doctorName, //'Dr. David Gilmour',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      therapistList.data[index].doctorExp + ' years Experience',
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
                                              therapistList.data[index].doctorType,
                                              //'Massage therapist',
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
                                                builder: (context) => AvailabilitySettings()));
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
                                              'Book Now',
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
                          ),
                        ),
                      );
                    },
                  );
                } //do whatever you want
              },
            ),
            FutureBuilder(
              future: commonBloc.hitGetApi(ApiUrl.therapist_list),
              builder: (context, AsyncSnapshot snap) {
                if (snap.data == null) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Center(
                      child: Text('Loading...'),
                    ),
                  );
                } else {
                  TherapistList therapistList = TherapistList.fromJson(snap.data);
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: therapistList.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorDetailScreen(
                                    doctorId: therapistList.data[index].doctorId) //OnGoingTreatment(),
                            ),
                          );
                        },
                        child: Container(
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
                          child: Container(
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
                                              'http://iconhomehealth.ca/assets/images/' +
                                                  therapistList.data[0].doctorPhoto,
                                              //    "https://th.bing.com/th/id/OIP.hw-Sk04AflX4Te0r8K4R9QAAAA?pid=ImgDet&rs=1"
                                            )))),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      therapistList.data[index].doctorName, //'Dr. David Gilmour',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      therapistList.data[index].doctorExp + ' years Experience',
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
                                              therapistList.data[index].doctorType,
                                              //'Massage therapist',
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
                                                builder: (context) => AvailabilitySettings()));
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
                                              'Book Now',
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
                          ),
                        ),
                      );
                    },
                  );
                } //do whatever you want
              },
            ),
            FutureBuilder(
              future: commonBloc.hitGetApi(ApiUrl.therapist_list),
              builder: (context, AsyncSnapshot snap) {
                if (snap.data == null) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Center(
                      child: Text('Loading...'),
                    ),
                  );
                } else {
                  TherapistList therapistList = TherapistList.fromJson(snap.data);
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: therapistList.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorDetailScreen(
                                    doctorId: therapistList.data[index].doctorId) //OnGoingTreatment(),
                            ),
                          );
                        },
                        child: Container(
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
                          child: Container(
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
                                              'http://iconhomehealth.ca/assets/images/' +
                                                  therapistList.data[0].doctorPhoto,
                                              //    "https://th.bing.com/th/id/OIP.hw-Sk04AflX4Te0r8K4R9QAAAA?pid=ImgDet&rs=1"
                                            )))),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      therapistList.data[index].doctorName, //'Dr. David Gilmour',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      therapistList.data[index].doctorExp + ' years Experience',
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
                                              therapistList.data[index].doctorType,
                                              //'Massage therapist',
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
                                                builder: (context) => AvailabilitySettings()));
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
                                              'Book Now',
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
                          ),
                        ),
                      );
                    },
                  );
                } //do whatever you want
              },
            ),
          ],
        ),
      ),
    );
  }
}
