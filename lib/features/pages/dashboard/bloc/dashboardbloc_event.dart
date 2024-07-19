part of 'dashboardbloc_bloc.dart';

@immutable
sealed class DashboardblocEvent {}

class DashboardActionableEvent extends DashboardblocEvent {}

class DashboardLoadingEvent extends DashboardblocEvent {}

class DashboardLoadingSuccessEvent extends DashboardblocEvent {}

class DashboardLoadingErrorEvent extends DashboardblocEvent {}

class DashboardScreenActiveEvent extends DashboardblocEvent {}

class DevicesScreenActiveEvent extends DashboardblocEvent {}

class ChatScreenActiveEvent extends DashboardblocEvent {}

class MaintenanceScreenActiveEvent extends DashboardblocEvent {}

class ReportScreenActiveEvent extends DashboardblocEvent {}
