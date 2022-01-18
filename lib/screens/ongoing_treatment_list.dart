import 'package:flutter/material.dart';

class OngoingTreatmentList extends StatefulWidget {
  const OngoingTreatmentList({Key? key}) : super(key: key);

  @override
  _OngoingTreatmentListState createState() => _OngoingTreatmentListState();
}

class _OngoingTreatmentListState extends State<OngoingTreatmentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                    color: Color(0xfff7f7f7),//s.grey,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap:(){ Navigator.pop(context);},
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05,
                              top:18,
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
                                left: MediaQuery.of(context).size.width * 0.13,top:5,),
                            // alignment: Alignment.center,
                            child: Text(
                              'Ongoing Treatments',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08,
                ),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, position) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        color: Colors.white,
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
                        //left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        child:  Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.05,
                                    ),
                                      width: MediaQuery.of(context).size.width * 0.20,
                                      height: MediaQuery.of(context).size.width * 0.20,
                                      decoration: new BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                          ),
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: new NetworkImage(
                                                  "https://th.bing.com/th/id/OIP.hw-Sk04AflX4Te0r8K4R9QAAAA?pid=ImgDet&rs=1")))),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.01,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height*0.01,
                                  ),
                                    color:Colors.grey,
                                    child: Text('Age: 25M',style: TextStyle(
                                      color: Colors.white,
                                    ),),),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.07,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'David Gilmour',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  'Message Therapy',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today_sharp,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.025,
                                    ),
                                    Text(
                                      '4 Jan 2022 | 5:42 PM',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                               /* SizedBox(height: 10),
                                Row(
                                  children: [
                                    InkWell(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.008,
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.008,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Confirm',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.025,
                                    ),
                                    InkWell(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.transparent,
                                          ),
                                          color: Colors.redAccent,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.008,
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.008,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),*/
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
