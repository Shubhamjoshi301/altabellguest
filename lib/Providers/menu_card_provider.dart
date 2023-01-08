import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class MenuCardProvider extends ChangeNotifier {
  final httpClient = http.Client();
  Map<String, String>? menuHeaders = {
    "Content-Type": "application/json",
    "Authorization":
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZU51bWJlciI6IjkxNTY2MDE4NjYiLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MDMzNTc4NywiZXhwIjoxNjcwMzM2OTg3fQ.gZQdKq-2-1-FgccbZXIpodFRVJar89N8JwfQemzJ6c0',
  };
  Map menuList = {};

  Future fetchMenuList(body, refreshBody) async {
    final Uri menuListAPIURL =
        Uri.parse("http://localhost:5000/api/v1/menu/list/item");
    final Uri refreshTokenAPIURL =
        Uri.parse("http://localhost:5000/api/v1/auth/refreshToken");
    http.Response response = await httpClient.post(menuListAPIURL,
        headers: menuHeaders, body: json.encode(body));
    if (response.statusCode == 401) {
      // print('resettoken menu');
      http.Response responseToken = await httpClient.post(refreshTokenAPIURL,
          headers: menuHeaders, body: jsonEncode(refreshBody));

      var tt = json.decode(responseToken.body)['authToken'];

      menuHeaders!['Authorization'] = tt;
      response = await httpClient.post(menuListAPIURL,
          headers: menuHeaders, body: json.encode(body));
    }
    menuList = jsonDecode(response.body);
    // print(menuList);
    return menuList;
  }
}
