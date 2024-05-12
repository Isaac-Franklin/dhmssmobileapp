part of 'dashboardbloc_bloc.dart';

@immutable
sealed class DashboardblocEvent {}

abstract class DashboardActionableEvent extends DashboardblocEvent {}

// upload csv file
class AddNewStaffEvent extends DashboardActionableEvent {}

// Add new device
class AddNewDeviceEvent extends DashboardActionableEvent {}
