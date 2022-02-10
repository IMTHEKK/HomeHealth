import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/models/customers.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/screens/patient/edit_profile.dart';
import 'package:untitled3/screens/selection.dart';
import 'package:untitled3/utilities/shared_preference/save_pref.dart';
import 'package:untitled3/utilities/utils.dart';

class Profile extends StatefulWidget {
  final id;

  const Profile({Key? key, required this.id}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
    ));
    return Scaffold(
      backgroundColor: Color(0xff92AFd9), //white70,
      body: SafeArea(
        top: false,
        child: FutureBuilder(
          future: commonBloc.hitGetApi(ApiUrl.view_profile + "?cs_id=" + widget.id),
          builder: (context, AsyncSnapshot snap) {
            if (snap.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              Customer customer = customerFromJson(json.encode(snap.data));
              return Stack(
                children: [
                  Container(
                    //color: Colors.red,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                  ),
                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.06,
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      child: Text(
                                        'Profile',
                                        style:
                                            TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.145,
                                left: MediaQuery.of(context).size.width * 0.04,
                                right: MediaQuery.of(context).size.width * 0.04,
                                bottom: MediaQuery.of(context).size.width * 0.07,
                              ),
                              child: Column(
                                children: [
                                  Card(
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(38),
                                        borderSide: BorderSide(color: Colors.transparent)),
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                                        Center(
                                          child: Text(
                                            customer.data[0].customerName,
                                            //"John Deo",
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                        Center(
                                          child: Text(
                                            customer.data[0].customerEmail,
                                            //"john_deo225@gmail.com",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13,
                                              //fontWeight: FontWeight.w600,
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: MediaQuery.of(context).size.height * 0.03,
                                            right: MediaQuery.of(context).size.height * 0.03,
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.person,
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(context).size.height * 0.01,
                                                  ),
                                                  Text('Full Name'),
                                                ],
                                              ),
                                              Text(
                                                customer.data[0].customerName, /*'John Deo'*/
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: MediaQuery.of(context).size.height * 0.03,
                                            right: MediaQuery.of(context).size.height * 0.03,
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.mail,
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(context).size.height * 0.01,
                                                  ),
                                                  Text('Email'),
                                                ],
                                              ),
                                              Container(
                                                width: MediaQuery.of(context).size.width * 0.45,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                      customer.data[0].customerEmail,
                                                      textAlign: TextAlign.right, /*'123 Royal Street, New York'*/
                                                    )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: MediaQuery.of(context).size.height * 0.03,
                                            right: MediaQuery.of(context).size.height * 0.03,
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.phone,
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(context).size.height * 0.01,
                                                  ),
                                                  Text('Phone Number'),
                                                ],
                                              ),
                                              Text(customer.data[0].customerPhone /*',+91 9999 888 777'*/),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: MediaQuery.of(context).size.height * 0.03,
                                            right: MediaQuery.of(context).size.height * 0.03,
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 24,
                                                    width: 24,
                                                    child: Image.asset(
                                                      'images/calendar.png',
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  /* Icon(Icons.calendar_today_outlined,                                color: Colors.grey,
                                            ),*/
                                                  SizedBox(
                                                    width: MediaQuery.of(context).size.height * 0.01,
                                                  ),
                                                  Text('Date of Birth'),
                                                ],
                                              ),
                                              Text(customer.data[0].customerDob /*'24 Aug, 1990'*/),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: MediaQuery.of(context).size.height * 0.03,
                                            right: MediaQuery.of(context).size.height * 0.03,
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(context).size.height * 0.01,
                                                  ),
                                                  Text('Address'),
                                                ],
                                              ),
                                              Container(
                                                width: MediaQuery.of(context).size.width * 0.45,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                      customer.data[0].customerAddress,
                                                      textAlign: TextAlign.right, /*'123 Royal Street, New York'*/
                                                    )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          //  left: MediaQuery.of(context).size.width * 0.03,
                                          right: MediaQuery.of(context).size.width * 0.03,
                                        ),
                                        height: MediaQuery.of(context).size.height * 0.06,
                                        width: MediaQuery.of(context).size.width * 0.42,
                                        child: InkWell(
                                          onTap: () {
                                            goToEdditProfile(customer);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Colors.transparent,
                                              ),
                                              borderRadius: BorderRadius.circular(30.0),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Center(
                                                  child: Text(
                                                    "Edit Profile",
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                      letterSpacing: 0,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width * 0.03,
                                          // right: MediaQuery.of(context).size.width * 0.03,
                                        ),
                                        height: MediaQuery.of(context).size.height * 0.06,
                                        width: MediaQuery.of(context).size.width * 0.42,
                                        child: InkWell(
                                          onTap: () async {
                                            SavePreference.addStringToSF('id', '');
                                            SavePreference.addStringToSF('email', '');
                                            SavePreference.addStringToSF('name', '');
                                            Utils.showToast(context, 'Sign out Successfully');
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Selection(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Colors.transparent,
                                              ),
                                              borderRadius: BorderRadius.circular(30.0),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Center(
                                                  child: Text(
                                                    "sign out",
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      // fontFamily: 'Montserrat',
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                      letterSpacing: 0,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.white,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(120.0),
                                      ),
                                      child: CachedNetworkImage(
                                        width: 120,
                                        height: 120,
                                        imageUrl:
                                            'http://iconhomehealth.ca/assets/images/' + customer.data[0].customerPhoto,
                                        //"https://th.bing.com/th/id/OIP.hw-Sk04AflX4Te0r8K4R9QAAAA?pid=ImgDet&rs=1",
                                        fit: BoxFit.cover,
                                        imageBuilder: (BuildContext context, ImageProvider<dynamic> imageProvider) {
                                          return Image(
                                            image: imageProvider as ImageProvider<Object>,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                        placeholder: (context, url) => Container(
                                          color: Colors.black12,
                                          child: const Icon(
                                            Icons.person,
                                            color: Colors.grey,
                                            size: 120,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) => Container(
                                          color: Colors.black12,
                                          child: const Icon(
                                            Icons.person,
                                            color: Colors.grey,
                                            size: 120,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  new Positioned(
                                    bottom: 10.0,
                                    right: 10.0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.blue,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: CircleAvatar(
                                        radius: 15,
                                        child: Container(
                                          height: 18,
                                          width: 18,
                                          child: Image.asset('images/pencil.png'),
                                        ),
                                        backgroundColor: Colors.white,
                                        //backgroundImage: Icon(Icons.edit),/*new NetworkImage(
                                        //   "https://www.pngfind.com/pngs/m/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.png"),
                                        //AssetImage('assets/camera.png'),*/
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } //do whatever you want
          },
        ),
      ),
    );
  }

  void goToEdditProfile(customer) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfile(
          customer: customer,
        ),
      ),
    );
    if (result == "true") {
      //Utils.showToast(context, "claal");
      setState(() {});
    }
  }
}
