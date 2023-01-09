import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class UserProvider extends ChangeNotifier {
  final httpClient = http.Client();
  Map<String, String>? hotelHeaders = {
    "Content-Type": "application/json",
    "Authorization":
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZU51bWJlciI6IjkxNTY2MDE4NjYiLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3Mjk5NTU3OCwiZXhwIjoxNjcyOTk2Nzc4fQ.BItxbNMILpUGEMgQUOgh5h_npmWkaxH66_CnK2A4d7c',
  };
  Map hotelData = {};

  //Get Request
  Future fetchUserData(Map body, Map refreshBody) async {
    // print(body);
    final Uri hotelAPIURL =
        Uri.parse("http://localhost:5000/api/v1/hotel/get");

    final Uri refreshTokenAPIURL =
        Uri.parse("http://localhost:5000/api/v1/auth/refreshToken");
    http.Response response = await httpClient.post(hotelAPIURL,
        headers: hotelHeaders, body: json.encode(body));

    if (response.statusCode == 401) {
      // print('resettoken user');
      http.Response responseToken = await httpClient.post(refreshTokenAPIURL,
          headers: hotelHeaders, body: jsonEncode(refreshBody));

      var tt = json.decode(responseToken.body)['authToken'];

      hotelHeaders!['Authorization'] = tt;

      response = await httpClient.post(hotelAPIURL,
          headers: hotelHeaders, body: json.encode(body));
    }

    hotelData = json.decode(response.body);
    // print(userData['data']['guest']['rooms'][0]['number']);
    return hotelData;
  }
}
