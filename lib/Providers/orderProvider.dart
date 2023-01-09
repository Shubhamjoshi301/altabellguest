

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class CategoryMenuProvider extends ChangeNotifier {
  final httpClient = http.Client();
  Map<String, String>? orderHeaders = {
    "Content-Type": "application/json",
    "Authorization":
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZU51bWJlciI6IjkxNTY2MDE4NjYiLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MDMzNTc4NywiZXhwIjoxNjcwMzM2OTg3fQ.gZQdKq-2-1-FgccbZXIpodFRVJar89N8JwfQemzJ6c0',
  };
  // Map menuList = {};

  Future fetchCategoryList(body, refreshBody) async {
    final Uri createOrderAPIURL =
        Uri.parse("http://localhost:5000/api/v1/order/create");
    final Uri refreshTokenAPIURL =
        Uri.parse("http://localhost:5000/api/v1/auth/refreshToken");
    http.Response response = await httpClient.post(createOrderAPIURL,
        headers: orderHeaders, body: json.encode(body));
    if (response.statusCode == 401) {
      // print('resettoken menu');
      http.Response responseToken = await httpClient.post(refreshTokenAPIURL,
          headers: orderHeaders, body: jsonEncode(refreshBody));

      var tt = json.decode(responseToken.body)['authToken'];

      orderHeaders!['Authorization'] = tt;
      response = await httpClient.post(createOrderAPIURL,
          headers: orderHeaders, body: json.encode(body));
    }
    // menuList = jsonDecode(response.body);
    // print(menuList);
    // return menuList;
  }
}
