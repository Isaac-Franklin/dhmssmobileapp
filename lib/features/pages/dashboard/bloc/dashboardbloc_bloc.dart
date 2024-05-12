import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dashboardbloc_event.dart';
part 'dashboardbloc_state.dart';

class DashboardblocBloc extends Bloc<DashboardblocEvent, DashboardblocState> {
  DashboardblocBloc() : super(DashboardblocInitial()) {
    // on<DashboardblocEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<AddNewStaffEvent>(addNewStaffEvent);
    on<AddNewDeviceEvent>(addNewDeviceEvent);
  }

  FutureOr<void> addNewStaffEvent(
      AddNewStaffEvent event, Emitter<DashboardblocState> emit) {
    print('Add new staff event triggered');
    emit(AddNewStaffState());
  }

  FutureOr<void> addNewDeviceEvent(
      AddNewDeviceEvent event, Emitter<DashboardblocState> emit) {
    print('add new device event triggered');
    emit(AddNewDeviceState());
  }
}
