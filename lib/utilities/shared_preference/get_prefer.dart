import 'package:shared_preferences/shared_preferences.dart';

class GetPreference {
  //Get Preference code
  Future<String?> getStringValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString(key);
    return stringValue;
  }

  Future<bool?> getBoolValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool? boolValue = prefs.getBool(key);
    return boolValue;
  }

  Future<int?> getIntValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int? intValue = prefs.getInt(key);
    return intValue;
  }

  Future<double?> getDoubleValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return double
    double? doubleValue = prefs.getDouble(key);
    return doubleValue;
  }
}
