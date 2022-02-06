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
                    height: MediaQuery.of(context).size.height * 0.36,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        /*margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.045,
                          right: MediaQuery.of(context).size.width * 0.045,
                          top: MediaQuery.of(context).size.height * 0.04,
                        ),*/
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Support',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                            Center(
                              child: Container(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.01,
                                ),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: MediaQuery.of(context).size.width * 0.35,
                                //            child: Image.asset('images/logo.png'),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                            Card(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Call Us Now: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text('\t' + helpModel.data.support.contactNumber /*01 2435796283'*/),
                                      ],
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                      Text(
                                        'Write to Us: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ' ' + helpModel.data.support.email, //' support@homeiconhealth.ca',
                                      ),
                                    ]),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Address:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.65,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                helpModel.data.support.address,
                                                //'ABC Society, XYZ Apartment, India, 251436 IN',
                                                textAlign: TextAlign.right,
                                              )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                            Text(
                              'FAQ\'s',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.01,
                              right: MediaQuery.of(context).size.width * 0.01,
                              top: MediaQuery.of(context).size.height * 0.015,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffd1d1d1)),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ExpansionTile(
                              title: Text(
                                helpModel.data.faq[index].question,
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
                              ),
                              children: <Widget>[ListTile(title: Text(helpModel.data.faq[index].answer))],
                            ),
                          );
                        },
                        itemCount: helpModel.data.faq.length,
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
