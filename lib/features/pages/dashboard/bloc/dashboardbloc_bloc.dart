import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'dashboardbloc_event.dart';
part 'dashboardbloc_state.dart';

class DashboardblocBloc extends Bloc<DashboardblocEvent, DashboardblocState> {
  DashboardblocBloc() : super(DashboardblocInitial()) {
    Future.delayed(const Duration(seconds: 10));
    on<DashboardScreenActiveEvent>(_dashboardScreenActiveEvent);
    on<DevicesScreenActiveEvent>(_devicesScreenActiveEvent);
    on<ChatScreenActiveEvent>(_chatScreenActiveEvent);
    on<MaintenanceScreenActiveEvent>(_maintenanceScreenActiveEvent);
    on<ReportScreenActiveEvent>(_reportScreenActiveEvent);
  }

  FutureOr<void> _dashboardLoadingEvent(
      DashboardLoadingEvent event, Emitter<DashboardblocState> emit) async {
    emit(DashboardLoadingState());
    Future.delayed(const Duration(seconds: 10));
    emit(DashboardLoadingSuccessState());
  }

  FutureOr<void> _dashboardScreenActiveEvent(DashboardScreenActiveEvent event,
      Emitter<DashboardblocState> emit) async {
    emit(DashboardLoadingState());
    Future.delayed(const Duration(seconds: 10));
    emit(DashboardScreenActiveState());
  }

  FutureOr<void> _devicesScreenActiveEvent(
      DevicesScreenActiveEvent event, Emitter<DashboardblocState> emit) async {
    emit(DashboardLoadingState());
    Future.delayed(const Duration(seconds: 10));
    emit(DevicesScreenActiveState());
  }

  FutureOr<void> _chatScreenActiveEvent(
      ChatScreenActiveEvent event, Emitter<DashboardblocState> emit) async {
    emit(DashboardLoadingState());
    Future.delayed(const Duration(seconds: 10));
    emit(ChatScreenActiveState());
  }

  FutureOr<void> _maintenanceScreenActiveEvent(
      MaintenanceScreenActiveEvent event,
      Emitter<DashboardblocState> emit) async {
    emit(DashboardLoadingState());
    Future.delayed(const Duration(seconds: 10));
    emit(MaintenanceScreenActiveState());
  }

  FutureOr<void> _reportScreenActiveEvent(
      ReportScreenActiveEvent event, Emitter<DashboardblocState> emit) async {
    emit(DashboardLoadingState());
    Future.delayed(const Duration(seconds: 10));
    emit(ReportScreenActiveState());
  }
}
