part of 'dashboardbloc_bloc.dart';

@immutable
sealed class DashboardblocState {}

// sealed class DashboardblocActionState {}
sealed class DashboardblocActionState extends DashboardblocState {}

final class DashboardblocInitial extends DashboardblocState {}

// Action build states for the nav bar UI
// abstract class NavBuildAction extends DashboardblocActionState {}

// navigate to staff page
class AddNewStaffState extends DashboardblocActionState {}

// Add new device
class AddNewDeviceState extends DashboardblocActionState {}

// // click on maintenance
// class DisplayNotificationBar extends DashboardblocActionState {}

// // click on settings
// class DisplayMenuBar extends DashboardblocActionState {}
