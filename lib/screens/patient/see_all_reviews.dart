import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled3/models/customers.dart';
import 'package:untitled3/models/testimonial_list.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';

class SeeAllReviews extends StatefulWidget {
  final dId;

  const SeeAllReviews({Key? key, this.dId}) : super(key: key);

  @override
  _SeeAllReviewsState createState() => _SeeAllReviewsState();
}

class _SeeAllReviewsState extends State<SeeAllReviews> with SingleTickerProviderStateMixin {
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
                    height: MediaQuery.of(context).size.height * 0.15,
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
                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Comment Screen',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Color(0XFFF4F4F5)),
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: TabBar(
                      labelPadding: EdgeInsets.all(0),
                      physics: ClampingScrollPhysics(),
                      controller: _tabController,
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.blue),
                      tabs: [
                        Tab(
                          child: Container(
                            margin: EdgeInsets.all(0),
                            child: Center(
                              child: Text(
                                "Newest First", //Components
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text(
                              "Negative Ratings First",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Center(
                              child: Text(
                                "Positive Rating First",
                                textAlign: TextAlign.center,
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
              future: commonBloc.hitGetApi(ApiUrl.get_testimonial_list + '?doctor_id=' + widget.dId + '&sortBy=newest'),
              builder: (context, AsyncSnapshot snap) {
                if (snap.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  print(snap.data.toString());
                  if (snap.data['code'] == 200) {
                    Testimonials testimonials = testimonialsFromJson(json.encode(snap.data));
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: testimonials.data.length,
                      itemBuilder: (context, index) {
                        return FutureBuilder(
                          future: commonBloc.hitGetApi(ApiUrl.view_profile +
                              '?cs_id=' +
                              testimonials.data[index].customerId.toString()),
                          builder: (context, AsyncSnapshot sn) {
                            if (sn.data == null) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              if (snap.data['code'] == 200) {
                                Customer customer = customerFromJson(json.encode(sn.data));
                                return Container(
                                  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.01,
                                    bottom: MediaQuery.of(context).size.height * 0.01,
                                    left: MediaQuery.of(context).size.width * 0.05,
                                    right: MediaQuery.of(context).size.width * 0.05,
                                  ),
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
                                                    //  "https://th.bing.com/th/id/OIP.hw-Sk04AflX4Te0r8K4R9QAAAA?pid=ImgDet&rs=1"
                                                    'http://iconhomehealth.ca/assets/images/' +
                                                        customer.data[0].customerPhoto,
                                                  )))),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          RatingBarIndicator(
                                            rating:
                                            double.parse(testimonials.data[0].ratings.toString()),
                                            itemBuilder: (context, index) => Icon(
                                              Icons.star,
                                              color: Colors.blue,
                                            ),
                                            itemCount: 5,
                                            itemSize: 20.0,
                                            direction: Axis.horizontal,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            testimonials.data[0].comments, //'Dr. David Gilmour',
                                            style: TextStyle(
                                                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
                                          ),
                                          SizedBox(height: 10),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.4,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Reviewed by: ' + customer.data[0].customerName,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            testimonials.data[0].createdAt,
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Text('error');
                              }
                            } //do whatever you want
                          },
                        );

                          InkWell(
                          onTap: () {},
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
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02,
                              bottom: MediaQuery.of(context).size.height * 0.02,
                              left: MediaQuery.of(context).size.width * 0.05,
                              right: MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Text('fyffftyfhgffg'),
                          ),
                        );
                      },
                    );
                  }
                  return Center(
                    child: Text(snap.data['validation-errors']),
                  );
                } //do whatever you want
              },
            ),
            FutureBuilder(
              future:
                  commonBloc.hitGetApi(ApiUrl.get_testimonial_list + '?doctor_id=' + widget.dId + '&sortBy=ratingLow'),
              builder: (context, AsyncSnapshot snap) {
                if (snap.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  print(snap.data.toString());
                  if (snap.data['code'] == 200) {
                    Testimonials testimonials = testimonialsFromJson(json.encode(snap.data));

                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: testimonials.data.length,
                      itemBuilder: (context, index) {
                        return FutureBuilder(
                          future: commonBloc.hitGetApi(ApiUrl.view_profile +
                              '?cs_id=' +
                              testimonials.data[index].customerId.toString()),
                          builder: (context, AsyncSnapshot sn) {
                            if (sn.data == null) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              if (snap.data['code'] == 200) {
                                Customer customer = customerFromJson(json.encode(sn.data));
                                return Container(
                                  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.01,
                                    bottom: MediaQuery.of(context).size.height * 0.01,
                                    left: MediaQuery.of(context).size.width * 0.05,
                                    right: MediaQuery.of(context).size.width * 0.05,
                                  ),
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
                                                    //  "https://th.bing.com/th/id/OIP.hw-Sk04AflX4Te0r8K4R9QAAAA?pid=ImgDet&rs=1"
                                                    'http://iconhomehealth.ca/assets/images/' +
                                                        customer.data[0].customerPhoto,
                                                  )))),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          RatingBarIndicator(
                                            rating:
                                            double.parse(testimonials.data[0].ratings.toString()),
                                            itemBuilder: (context, index) => Icon(
                                              Icons.star,
                                              color: Colors.blue,
                                            ),
                                            itemCount: 5,
                                            itemSize: 20.0,
                                            direction: Axis.horizontal,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            testimonials.data[0].comments, //'Dr. David Gilmour',
                                            style: TextStyle(
                                                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
                                          ),
                                          SizedBox(height: 10),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.4,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Reviewed by: ' + customer.data[0].customerName,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            testimonials.data[0].createdAt,
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Text('error');
                              }
                            } //do whatever you want
                          },
                        );

                        InkWell(
                          onTap: () {},
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
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02,
                              bottom: MediaQuery.of(context).size.height * 0.02,
                              left: MediaQuery.of(context).size.width * 0.05,
                              right: MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Text('fyffftyfhgffg'),
                          ),
                        );
                      },
                    );
                  }
                  return Center(
                    child: Text(snap.data['validation-errors']),
                  );
                } //do whatever you want
              },
            ),
            FutureBuilder(
              future:
                  commonBloc.hitGetApi(ApiUrl.get_testimonial_list + '?doctor_id=' + widget.dId + '&sortBy=ratingHigh'),
              builder: (context, AsyncSnapshot snap) {
                if (snap.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  print(snap.data.toString());
                  if (snap.data['code'] == 200) {
                    Testimonials testimonials = testimonialsFromJson(json.encode(snap.data));

                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: testimonials.data.length,
                      itemBuilder: (context, index) {
                        return FutureBuilder(
                          future: commonBloc.hitGetApi(ApiUrl.view_profile +
                              '?cs_id=' +
                              testimonials.data[index].customerId.toString()),
                          builder: (context, AsyncSnapshot sn) {
                            if (sn.data == null) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              if (snap.data['code'] == 200) {
                                Customer customer = customerFromJson(json.encode(sn.data));
                                return Container(
                                  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.01,
                                    bottom: MediaQuery.of(context).size.height * 0.01,
                                    left: MediaQuery.of(context).size.width * 0.05,
                                    right: MediaQuery.of(context).size.width * 0.05,
                                  ),
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
                                                    //  "https://th.bing.com/th/id/OIP.hw-Sk04AflX4Te0r8K4R9QAAAA?pid=ImgDet&rs=1"
                                                    'http://iconhomehealth.ca/assets/images/' +
                                                        customer.data[0].customerPhoto,
                                                  )))),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          RatingBarIndicator(
                                            rating:
                                            double.parse(testimonials.data[0].ratings.toString()),
                                            itemBuilder: (context, index) => Icon(
                                              Icons.star,
                                              color: Colors.blue,
                                            ),
                                            itemCount: 5,
                                            itemSize: 20.0,
                                            direction: Axis.horizontal,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            testimonials.data[0].comments, //'Dr. David Gilmour',
                                            style: TextStyle(
                                                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
                                          ),
                                          SizedBox(height: 10),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.4,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Reviewed by: ' + customer.data[0].customerName,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            testimonials.data[0].createdAt,
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Text('error');
                              }
                            } //do whatever you want
                          },
                        );

                        InkWell(
                          onTap: () {},
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
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02,
                              bottom: MediaQuery.of(context).size.height * 0.02,
                              left: MediaQuery.of(context).size.width * 0.05,
                              right: MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Text('fyffftyfhgffg'),
                          ),
                        );
                      },
                    );
                  }
                  return Center(
                    child: Text(snap.data['validation-errors']),
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
