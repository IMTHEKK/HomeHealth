import 'package:flutter/material.dart';

class VerifyOTP extends StatefulWidget {
  final userId, userType, otpType;

  const VerifyOTP({Key? key, this.userId, this.userType, this.otpType}) : super(key: key);

  @override
  _VerifyOTPState createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
