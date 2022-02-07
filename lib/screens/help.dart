import 'package:flutter/material.dart';
import 'package:untitled3/models/help_model.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: commonBloc.hitGetApi(ApiUrl.help),
      builder: (context, AsyncSnapshot snap) {
        if (snap.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          HelpModel helpModel = HelpModel.fromJson(snap.data);
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SafeArea(
              top: false,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'images/welcome_background.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.06),
                              child: Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: MediaQuery.of(context).size.width *
                                            0.06),
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      child: Text(
                                        'Support',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                      //            child: Image.asset('images/logo.png'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.13),
                            Card(
                              margin: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.05),
                              elevation: 20,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(10),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.call,
                                          color: Colors.blue,
                                        ),
                                        Text("   " +
                                            helpModel.data.support
                                                .contactNumber /*01 2435796283'*/),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Row(children: [
                                      Icon(
                                        Icons.mail,
                                        color: Colors.blue,
                                      ),
                                      Text(
                                        "   " +
                                            helpModel.data.support
                                                .email, //' support@homeiconhealth.ca',
                                      ),
                                    ]),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.blue,
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                  child: Text(
                                                "   " +
                                                    helpModel
                                                        .data.support.address,
                                                //'ABC Society, XYZ Apartment, India, 251436 IN',
                                                textAlign: TextAlign.right,
                                              )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.05),
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.height * 0.015,
                              ),
                              child: Text(
                                'FAQ\'s',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.01,
                                    right: MediaQuery.of(context).size.width *
                                        0.01,
                                    top: MediaQuery.of(context).size.height *
                                        0.007,
                                    bottom: MediaQuery.of(context).size.height *
                                        0.007,
                                  ),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xffd1d1d1)),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: ExpansionTile(
                                    iconColor: Colors.blue,
                                    collapsedIconColor: Colors.blue,
                                    title: Text(
                                      helpModel.data.faq[index].question,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    children: <Widget>[
                                      ListTile(
                                        title: Text(
                                          helpModel.data.faq[index].answer,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                              itemCount: helpModel.data.faq.length,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
