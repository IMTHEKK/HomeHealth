import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:untitled3/network/constant.dart';
import 'package:untitled3/utilities/shared_preference/get_prefer.dart';
import 'package:untitled3/utilities/shared_preference/pref_constants.dart';

class ApiProvider<T> {
  Client client = Client();

  Future<T> hitGetApi(String apiUrl) async {
    String? token =
        await GetPreference().getStringValuesSF(PreferenceConstants.token);
    print(token);
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": token == null ? "" : token,
    };
    var url = Uri.parse(Constants.SERVER_ONE + apiUrl);
    Response response = await client.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      String data =
          await rootBundle.loadString("assets/files/unAuthorise.json");
      return json.decode(data);
    } else {
      throw Exception(json.decode(response.body));
    } // check the status code for the result
  }

  Future<T> hitPostApi(Map<String, dynamic> bodyParams, String apiUrl) async {
    String? token =
        await GetPreference().getStringValuesSF(PreferenceConstants.token);
    Map<String, String> headers ={
      "Content-Type": "application/json",
    //  "Authorization": token == null ? "" : token,
    };
    var url = Uri.parse(/*Constants.SERVER_ONE + */apiUrl);
    Response response = await client.post(
      url,
      body: json.encode(bodyParams),
    //  headers: headers,
      //encoding: Encoding.getByName("utf-8"),
    );
    print('#################'+response.statusCode.toString()+'  '+response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      String data =
          await rootBundle.loadString("assets/files/unAuthorise.json");
      return json.decode(data);
    } else {
      throw Exception(json.decode(response.body));
    } // check the status code for the result
  }
}

class Repository<T> {
  final apiProvider = ApiProvider();

  Future<dynamic> hitGetApi(String apiUrl) => apiProvider.hitGetApi(apiUrl);

  Future<dynamic> hitPostApi(Map<String, dynamic> bodyParams, String apiUrl) =>
      apiProvider.hitPostApi(bodyParams, apiUrl);
}
