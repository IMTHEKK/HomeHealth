import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled3/models/therapist_list.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/screens/doctor_detail.dart';

class SearchDoctor extends StatefulWidget {
  final cId, type;

  const SearchDoctor({Key? key, this.cId, this.type}) : super(key: key);

  @override
  _SearchDoctorState createState() => _SearchDoctorState();
}

class _SearchDoctorState extends State<SearchDoctor> {
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('faskfbjsbdj URL: ' + widget.type);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Column(
              children: [
                Container(
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
                        controller: textController,
                        decoration: InputDecoration(
                            hintText: 'Search therapist, specialities...',
                            //  contentPadding: EdgeInsets.all(15),
                            border: InputBorder.none),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.87,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: FutureBuilder(
                      future: commonBloc.hitGetApi(widget.type + '${textController.text}'),
                      builder: (context, AsyncSnapshot snap) {
                        if (snap.hasData) {
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
                                    color: Colors.white,
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
                            },
                          );
                        } else {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
