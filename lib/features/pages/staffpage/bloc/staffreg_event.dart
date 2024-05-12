part of 'staffreg_bloc.dart';

@immutable
sealed class StaffregEvent {}

class StartActionState extends StaffregEvent {}

class MoveToHomePage extends StaffregEvent {}
