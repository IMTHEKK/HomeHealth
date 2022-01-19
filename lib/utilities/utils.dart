import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/screens/selection.dart';
import 'package:untitled3/utilities/shared_preference/pref_constants.dart';

class Utils {
  static bool validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9](\.?[a-zA-Z0-9_-]){1,}@([\w\-]+)((\.(\w){2,})+)$";
    RegExp regex = new RegExp(pattern,multiLine: true);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }

  static bool validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool validateMobile(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool isDeviceMobile(BuildContext context) {
    var smallestDimension = MediaQuery.of(context).size.shortestSide;
    return smallestDimension < 600;
  }

  static void showToast(BuildContext context, String msg) {}

  static Future<void> goToLoginScreen(context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getKeys();
    for (String key in preferences.getKeys()) {
      if (key != PreferenceConstants.company_code &&
          key != PreferenceConstants.company_logo) {
        preferences.remove(key);
      }
    }
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Selection(),
      ),
      ModalRoute.withName(
        "/Home",
      ),
    );
  }

  static Future<void> goToLoginWithoutPreferenceScreen(context) async {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Selection(),
      ),
      ModalRoute.withName(
        "/Home",
      ),
    );
  }
}
