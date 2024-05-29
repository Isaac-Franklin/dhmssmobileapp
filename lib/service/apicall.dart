import 'dart:io';
import 'package:dhmsmobileapp/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';
import 'dart:convert';

final storage = FlutterSecureStorage();

Future apiCall() async {
  var client = http.Client();
  try {
    var response = await client.post(
      Uri.parse('https://dhms.itservicedeskafrica.com/api/orglogin/'),
      // Uri.parse('http://127.0.0.1:8000/api/orglogin/'),
      // Uri.parse('https://randomuser.me/api/?results=10'),
      body: {"email": "isaacfrank197@gmail.com", "password": "123"},
    );
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    var Token = decodedResponse['Token'];
    var SessionID = decodedResponse['SessionID'];
    return {"token": Token, "sessionId": SessionID};
  } catch (e) {
    print(e.toString());
  }
}

Future getProfile() async {
  var client = http.Client();
  final mainUserProfile = [];

  try {
    final accessToken = await apiCall();
    // Create a map to hold the cookies
    Map<String, String> cookies = {
      'csrftoken': accessToken['token'], // Set the token in the cookie
      'sessionid': accessToken['sessionId'], // Set the session ID in the cookie
    };

    // Create a cookie header string from the map
    String cookieHeader =
        cookies.entries.map((e) => '${e.key}=${e.value}').join('; ');
    var response = await client.get(
      Uri.parse(
        'https://dhms.itservicedeskafrica.com/api/orgprofile/',
        // 'https://jsonplaceholder.typicode.com/posts',
      ),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
        'cookie': cookieHeader
      },
    );
    var responseBody = response.body;
    // print(responseBody);
    final body = responseBody;
    final jsonData = jsonDecode(body);
    final jsonDataMain = jsonData['data'];
    mainUserProfile.add(jsonDataMain);
    print(mainUserProfile);
    return mainUserProfile;
    // return jsonData.map((e) => UserData.fromJson(e)).toList();

    // final results = json['results'] as List<dynamic>;
    // print({'results': results});
    // final user = results.map(
    //   (e) {
    //     return UserData(
    //       companyname: e['companyname'],
    //       companyUniqueId: e['companyUniqueID'],
    //       email: e['email'],
    //       phone: e['phone'],
    //       password: e['password'],
    //     );
    //   },
    // ).toList();
    // print({'user': user});
    // return user;

    // );
    // return responseBody;
  } catch (e) {
    print(e.toString());
  }
  // Cookie(String name, String value);
}
