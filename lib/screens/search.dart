import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled3/models/therapist_list.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/screens/doctor_detail.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  throw UnimplementedError();
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: SafeArea(
          top: false,
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
                      margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:IconButton(
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
          /*    TabBarView(children: [
                Text('All'),
                Text('Top Rated'),
                Text('Best Reviews'),
              ],),
*/
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorDetailScreen(doctorId:therapistList.data[index].doctorId)//OnGoingTreatment(),
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
        ),
      ),
    );
  }
}
