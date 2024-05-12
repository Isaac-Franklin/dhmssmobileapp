import 'dart:convert';
import 'package:dhmsmobileapp/model/usermodel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UserAPI {
  static Future<List<User>> mainApp() async {
    print('running');
    // var url = Uri.https('https://randomuser.me/api/?results=10');
    var url = 'https://randomuser.me/api/?results=100';

    // Await the http get response, then decode the json-formatted response.
    final mainresponse = Uri.parse(url);
    var response = await http.get(mainresponse);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final user = results.map(
      (e) {
        // final name = Username(
        //   title: e['name']['title'],
        //   firstname: e['name']['first'],
        //   lastname: e['name']['last'],
        // );
        return User(
          username: e['name']['first'],
          email: e['email'],
          phone: e['phone'],
          name: e['name'],
        );
      },
    ).toList();
    return user;
  }
}
