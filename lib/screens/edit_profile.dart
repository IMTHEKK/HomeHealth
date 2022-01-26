import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled3/models/customers.dart';
import 'package:untitled3/network/api_blocs.dart';
import 'package:untitled3/network/api_urls.dart';
import 'package:untitled3/utilities/utils.dart';

class EditProfile extends StatefulWidget {
  final Customer customer;

  EditProfile({Key? key, required this.customer}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var dobController = TextEditingController();
  var addressController = TextEditingController();
  bool isVisible = false;
  var imageFile;

  bool isValid() {
    if (fullNameController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter your full name");
      return false;
    } else if (!Utils.validateEmail(emailController.text.toString())) {
      Utils.showToast(context, "Please enter valid email");
      return false;
    } else if (phoneController.text.toString().isEmpty || phoneController.text.length > 10) {
      Utils.showToast(context, "Please enter valid phone");
      return false;
    } else if (dobController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter valid DOB");
      return false;
    } else if (addressController.text.toString().isEmpty) {
      Utils.showToast(context, "Please enter valid Address");
      return false;
    }
    return true;
  }

  @override
  void initState() {
    fullNameController.text = widget.customer.data[0].customerName;
    emailController.text = widget.customer.data[0].customerEmail;
    phoneController.text = widget.customer.data[0].customerPhone;
    dobController.text = widget.customer.data[0].customerDob;
    addressController.text = widget.customer.data[0].customerAddress;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
    ));

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
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
                                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.22),
                                  // alignment: Alignment.center,
                                  child: Text(
                                    'Edit profile',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
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
                                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(38), borderSide: BorderSide(color: Colors.transparent)),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: MediaQuery.of(context).size.height * 0.03,
                                        right: MediaQuery.of(context).size.height * 0.03,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                          Container(
                                              margin: EdgeInsets.only(left: 32),
                                              child: TextField(
                                                controller: fullNameController,
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: MediaQuery.of(context).size.height * 0.03,
                                        right: MediaQuery.of(context).size.height * 0.03,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                              Text('Email Address'),
                                            ],
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(left: 32),
                                              child: TextField(
                                                controller: emailController,
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: MediaQuery.of(context).size.height * 0.03,
                                        right: MediaQuery.of(context).size.height * 0.03,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                          Container(
                                              margin: EdgeInsets.only(left: 32),
                                              child: TextField(
                                                controller: phoneController,
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: MediaQuery.of(context).size.height * 0.03,
                                        right: MediaQuery.of(context).size.height * 0.03,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                              SizedBox(
                                                width: MediaQuery.of(context).size.height * 0.01,
                                              ),
                                              Text('Date of Birth'),
                                            ],
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(left: 32),
                                              child: TextField(
                                                controller: dobController,
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: MediaQuery.of(context).size.height * 0.03,
                                        right: MediaQuery.of(context).size.height * 0.03,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                              margin: EdgeInsets.only(left: 32),
                                              child: TextField(
                                                controller: addressController,
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: MediaQuery.of(context).size.width * 0.1,
                                        right: MediaQuery.of(context).size.width * 0.1,
                                      ),
                                      height: MediaQuery.of(context).size.height * 0.06,
                                      width: MediaQuery.of(context).size.width,
                                      child: GestureDetector(
                                        onTap: () async {
                                          isVisible = true;
                                          setState(() {});
                                          final bytes = imageFile.readAsBytesSync();
                                          var img64 = base64Encode(bytes);
                                          Map<String, dynamic> params = {
                                            'customerPhoto':imageFile!=null?img64:widget.customer.data[0].customerPhoto.toString(),
                                            'full-name': fullNameController.text,
                                            'email': emailController.text,
                                            'phone-number': phoneController.text,
                                            'address': addressController.text,
                                            'dob': dobController.text,
                                            'password':widget.customer.data[0].customerPassword,
                                          };
                                          if (isValid()) {
                                            var res = await commonBloc.hitPostApi(params, ApiUrl.edit_profile+'?cs_id='+widget.customer.data[0].customerId);
                                            if (res['code'] == 200) {
                                              Utils.showToast(context, 'Details uploaded Successfully');
                                              Navigator.pop(context);
                                            } else if (res['code'] == 400) {
                                              Utils.showToast(
                                                  context,'${res['validation-errors']}');
                                            } else {
                                              Utils.showToast(context, 'User update failed');
                                            }
                                          }
                                          isVisible = false;
                                          setState(() {});
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
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
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
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
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: <Widget>[
                            InkWell(
                              onTap:() async {
                                final pickedImage =
                                    await ImagePicker().getImage(source: ImageSource.gallery);
                                setState(() {
                                  imageFile = pickedImage != null ? File(pickedImage.path) : null;
                                  //var imgPath=pickedImage.path;
                                });
                              },
                              child: Container(
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
                                  child: (imageFile==null)?
                                  CachedNetworkImage(
                                    width: 120,
                                    height: 120,
                                    imageUrl:'http://iconhomehealth.ca/assets/images/'+widget.customer.data[0].customerPhoto,
                                    //"https://th.bing.com/th/id/OIP.hw-Sk04AflX4Te0r8K4R9QAAAA?pid=ImgDet&rs=1",
                                    fit: BoxFit.cover,
                                    imageBuilder: (BuildContext context, ImageProvider<dynamic> imageProvider) {
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
                                  ):
                                  Image(
                                    image: FileImage(/*File(*/ imageFile /*)*/),
                                    width: 120,
                                    height: 120,
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
                                  child: Container(
                                    height: 18,
                                    width: 18,
                                    child: Image.asset('images/pencil.png'),
                                  ),
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
          Visibility(
            visible: isVisible,
            child: SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.red : Colors.green,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
