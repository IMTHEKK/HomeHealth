import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled3/models/testimonial_list.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/utilities/text_wrapper.dart';

class MyReviews extends StatefulWidget {
  final id;

  const MyReviews({Key? key, this.id}) : super(key: key);

  @override
  _MyReviewsState createState() => _MyReviewsState();
}

class _MyReviewsState extends State<MyReviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: SafeArea(
          top: false,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Color(0xfff7f7f7), //s.grey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                top: 20,
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.18,
                                top: 5,
                              ),
                              // alignment: Alignment.center,
                              child: Text(
                                'My Reviews',
                                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.12,
                  ),
                  child: FutureBuilder(
                    future: commonBloc.hitGetApi(

                        ///  'https://run.mocky.io/v3/eb5f43d1-0e08-48c1-be04-292dae6b8138'),
                        ApiUrl.get_testimonial_list + '?th_id=' + widget.id.toString()),
                    builder: (context, AsyncSnapshot snap) {
                      if (snap.data == null) {
                          return Container(
                           // color: Colors.white,
                            height: MediaQuery.of(context).size.height,
                            child:
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(color:Colors.white),
                                  ],
                                ),
                              )
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
                                              Text(
                                                testimonials.data[position].name,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              SizedBox(height: 10),
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
                                             /* SizedBox(height: 10),
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.4,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        *//*'Reviewed by: ' + *//*testimonials.data[position].name,
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),*/
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
                          child: Text("No Review Available"),
                        );
                      } //do whatever you want
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
