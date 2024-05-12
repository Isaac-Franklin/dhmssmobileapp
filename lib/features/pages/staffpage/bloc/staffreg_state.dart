part of 'staffreg_bloc.dart';

@immutable
sealed class StaffregState {}

// sealed class StaffRegStateActionState extends StaffregState {}

class StaffregInitial extends StaffregState {}

class StaffPageLoadingState extends StaffregState {}

class StaffPageSuccessLoadingState extends StaffregState {
  StaffPageSuccessLoadingState();
}

class StaffPageErrorLoadingState extends StaffregState {
  late final List<User> userList;
}

class Navigatetohomepage extends StaffregState {}
