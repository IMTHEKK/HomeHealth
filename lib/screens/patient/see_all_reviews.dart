import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled3/models/testimonial_list.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/utilities/text_wrapper.dart';

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
                  Column(
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
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
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
                              padding: const EdgeInsets.all(0),
                              child: Text(
                                'Customers Reviews',
                                style: TextStyle(
                                  fontSize: 22,
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
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
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
                            margin: EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                "Newest First", //Components
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Center(
                              child: Text(
                                "Negative First",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Center(
                              child: Text(
                                "Positive First",
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
                  return Center(child: CircularProgressIndicator());
                } else {
                  print(snap.data.toString());
                  if (snap.data['code'] == 200) {
                    Testimonials testimonials = testimonialsFromJson(json.encode(snap.data));
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: testimonials.data.length,
                      itemBuilder: (context, position) {
                        return Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01,
                            bottom: MediaQuery.of(context).size.height * 0.01,
                            left: MediaQuery.of(context).size.width * 0.05,
                            right: MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
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
                                                    testimonials.data[position].photo,
                                              )))),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.05,
                                      right: MediaQuery.of(context).size.width * 0.05,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10),
                                        /*
                                        Text(
                                          testimonials.data[position].name,
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(height: 10),*/
                                        RatingBarIndicator(
                                          rating: double.parse(testimonials.data[position].ratings.toString()),
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: Colors.blue,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          child: TextWrapper(text: testimonials.data[position].comments),
                                        ),
                                        SizedBox(height: 10),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.4,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  testimonials.data[position].name,
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
                                          testimonials.data[position].createdAt,
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
              future: commonBloc.hitGetApi(ApiUrl.get_testimonial_list + '?doctor_id=' + widget.dId + '&sortBy=ratingLow'),
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
                      itemBuilder: (context, position) {
                        return Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: EdgeInsets.only(
                            //  top: MediaQuery.of(context).size.height * 0.01,
                            bottom: MediaQuery.of(context).size.height * 0.01,
                            left: MediaQuery.of(context).size.width * 0.05,
                            right: MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
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
                                                    testimonials.data[position].photo,
                                              )))),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.05,
                                      right: MediaQuery.of(context).size.width * 0.05,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10),
                                        /*  Text(
                                          testimonials.data[position].name,
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(height: 10),*/
                                        RatingBarIndicator(
                                          rating: double.parse(testimonials.data[position].ratings.toString()),
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: Colors.blue,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          child: TextWrapper(text: testimonials.data[position].comments),
                                        ),
                                        SizedBox(height: 10),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.4,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  testimonials.data[position].name,
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
                                          testimonials.data[position].createdAt,
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
              future: commonBloc.hitGetApi(ApiUrl.get_testimonial_list + '?doctor_id=' + widget.dId + '&sortBy=ratingHigh'),
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
                      itemBuilder: (context, position) {
                        return Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01,
                            bottom: MediaQuery.of(context).size.height * 0.01,
                            left: MediaQuery.of(context).size.width * 0.05,
                            right: MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
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
                                                    testimonials.data[position].photo,
                                              )))),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.05,
                                      right: MediaQuery.of(context).size.width * 0.05,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10),
                                        /*Text(
                                          testimonials.data[position].name,
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(height: 10),*/
                                        RatingBarIndicator(
                                          rating: double.parse(testimonials.data[position].ratings.toString()),
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: Colors.blue,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          child: TextWrapper(text: testimonials.data[position].comments),
                                        ),
                                        SizedBox(height: 10),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.4,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  testimonials.data[position].name,
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
                                          testimonials.data[position].createdAt,
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
