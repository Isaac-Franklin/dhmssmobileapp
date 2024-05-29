part of 'profilesection_bloc.dart';

@immutable
sealed class ProfilesectionState {
  get user => null;
}

final class ProfilesectionInitialState extends ProfilesectionState {}

final class GetProfileDetailsLoading extends ProfilesectionState {}

final class GetProfileDetailsLoadSuccess extends ProfilesectionState {}

final class AllProfileDetails extends ProfilesectionState {
  final List<UserData> userdetails;
  AllProfileDetails({
    required this.userdetails,
  });

  // static AllProfileDetails fromMap(Map<String, dynamic> user) {}
}

class AllProfileDetailsError extends ProfilesectionState {
  final String message;

  AllProfileDetailsError(this.message);

  @override
  List<Object> get props => [message];
}
