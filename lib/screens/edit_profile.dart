import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
    ));

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          top: false,
          child: Stack(
            children: [
              Container(
                color: Color(0xff92afd9),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
              ),
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.025,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                size: 32,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.22),
                              // alignment: Alignment.center,
                              child: Text(
                                'Edit profile',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
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
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            color: Colors.white,
                            child: Column(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.12),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height *
                                        0.03,
                                    right: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.person,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text('Full Name'),
                                        ],
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(left: 32),
                                          child: TextField()),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height *
                                        0.03,
                                    right: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.mail,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text('Email Address'),
                                        ],
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(left: 32),
                                          child: TextField()),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height *
                                        0.03,
                                    right: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text('Phone Number'),
                                        ],
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(left: 32),
                                          child: TextField()),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height *
                                        0.03,
                                    right: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 24,
                                            width: 24,
                                            child: Image.asset(
                                              'images/calendar.png',
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text('Date of Birth'),
                                        ],
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(left: 32),
                                          child: TextField()),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height *
                                        0.03,
                                    right: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text('Address'),
                                        ],
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(left: 32),
                                          child: TextField()),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04),
                                Container(
                                  margin: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * 0.1,
                                    right:
                                        MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width: MediaQuery.of(context).size.width,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Center(
                                            child: Text(
                                              "Submit".toUpperCase(),
                                              style: TextStyle(
                                                color: Colors.white,
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
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.13),
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
                                  "https://th.bing.com/th/id/OIP.hw-Sk04AflX4Te0r8K4R9QAAAA?pid=ImgDet&rs=1",
                              fit: BoxFit.cover,
                              imageBuilder: (BuildContext context,
                                  ImageProvider<dynamic> imageProvider) {
                                return Image(
                                  image: imageProvider as ImageProvider<Object>,
                                  fit: BoxFit.cover,
                                );
                              },
                              placeholder: (context, url) => ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(120.0),
                                ),
                                child: Container(
                                  color: Colors.black12,
                                  child: const Icon(
                                    Icons.person,
                                    size: 120,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(120.0),
                                ),
                                child: Container(
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
                        ),
                        Positioned(
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
                              child:   Container(
                                height: 18,
                                width: 18,
                                child: Image.asset('images/pencil.png'),),
                              //Icon(Icons.edit),
                              backgroundColor: Colors.white,
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
      ),
    );
  }
}
