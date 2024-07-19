part of 'dashboardbloc_bloc.dart';

@immutable
sealed class DashboardblocState {}

// sealed class DashboardblocActionState {}
sealed class DashboardblocActionState extends DashboardblocState {}

final class DashboardblocInitial extends DashboardblocState {}

class DashboardLoadingState extends DashboardblocState {}

class DashboardLoadingSuccessState extends DashboardblocState {}

class DashboardLoadingErrorState extends DashboardblocState {}

// navigate to staff page
class AddNewStaffState extends DashboardblocActionState {}

// Add new device
class AddNewDeviceState extends DashboardblocActionState {}

class DashboardScreenActiveState extends DashboardblocActionState {}

class DevicesScreenActiveState extends DashboardblocActionState {}

class ChatScreenActiveState extends DashboardblocActionState {}

class MaintenanceScreenActiveState extends DashboardblocActionState {}

class ReportScreenActiveState extends DashboardblocActionState {}
