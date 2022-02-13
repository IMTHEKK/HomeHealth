import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:untitled3/network/constant.dart';
import 'package:untitled3/screens/doctor/therapy_completion_form.dart';
import 'package:untitled3/screens/onboard.dart';
import 'package:untitled3/screens/payment_screen.dart';
import 'package:untitled3/screens/splash.dart';

void main() async {
  if (kDebugMode) {
    Constants.setEnvironment(Environment.DEV);
  } else {
    Constants.setEnvironment(Environment.STAGING);
  }
  WidgetsFlutterBinding.ensureInitialized();

  // set the publishable key for Stripe - this is mandatory
  Stripe.publishableKey = "pk_test_51KIylfK3RxekJkNFwAzSMuIxLX0USGidcexLHcoN7jYPzHdqzfs1UWtPeU8P8XZrIiAeZEMjxHzcgxTZESHVVDFC00MStXS5OO";
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'poppins',
        primarySwatch: Colors.blue,
      ),
      home: /*TherapyCompletionForm(),*/WebhookPaymentScreen(), // /* EditProfile(),*/ Selection(),
    );
  }
}
