import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dhmsmobileapp/model/usermodel.dart';
import 'package:dhmsmobileapp/service/apicall.dart';
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
    await Future.delayed(const Duration(seconds: 3));
    emit(StaffPageSuccessLoadingState());
    apiCall();
  }

  FutureOr<void> moveToHomePage(
      MoveToHomePage event, Emitter<StaffregState> emit) {
    emit(Navigatetohomepage());
  }
}
