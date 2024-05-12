import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dhmsmobileapp/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

part 'staffreg_event.dart';
part 'staffreg_state.dart';

class StaffregBloc extends Bloc<StaffregEvent, StaffregState> {
  StaffregBloc() : super(StaffregInitial()) {
    on<StartActionState>(startActionState);
    on<MoveToHomePage>(moveToHomePage);
  }

  FutureOr<void> startActionState(
      StartActionState event, Emitter<StaffregState> emit) async {
    emit(StaffPageLoadingState());
    await Future.delayed(const Duration(seconds: 5));
    emit(StaffPageSuccessLoadingState());
    var client = http.Client();
    try {
      var response = await client.post(
        Uri.parse('https://dhms.itservicedeskafrica.com/api/orglogin/'),
        // Uri.parse('https://randomuser.me/api/?results=10'),
        body: {'email': 'isaacfrank197@gmail.com', 'password': '123'},
      );
      // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      // var uri = Uri.parse(decodedResponse['uri'] as String);
      // print(await client.get(uri));
      print('Response body: ${response.body}');
    } catch (e) {
      print(e.toString());
    }
  }

  FutureOr<void> moveToHomePage(
      MoveToHomePage event, Emitter<StaffregState> emit) {
    emit(Navigatetohomepage());
  }
}
