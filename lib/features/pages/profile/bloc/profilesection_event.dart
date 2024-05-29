part of 'profilesection_bloc.dart';

@immutable
sealed class ProfilesectionEvent {}

class ProfileSectionBaseEvent extends ProfilesectionEvent {}

class NavigateToDashboardEvent extends ProfilesectionEvent {}
