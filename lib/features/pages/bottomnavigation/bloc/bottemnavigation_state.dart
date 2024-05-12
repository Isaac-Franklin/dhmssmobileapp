part of 'bottemnavigation_bloc.dart';

@immutable
sealed class BottemnavigationState {}

final class BottemnavigationInitial extends BottemnavigationState {}

// Action build states for the nav bar UI
abstract class NavBuildAction extends BottemnavigationState {}

// click on inventory
class NavigateToInventoryPage extends NavBuildAction {}

// click on maintenance
class NavigateToMaintenancePage extends NavBuildAction {}

// click on settings
class NavigateToSettingsPage extends NavBuildAction {}

// click on maintenance
class DisplayNotificationBar extends BottemnavigationState {}

// click on settings
class DisplayMenuBar extends BottemnavigationState {}
