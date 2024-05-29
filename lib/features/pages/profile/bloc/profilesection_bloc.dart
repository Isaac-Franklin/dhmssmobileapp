import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dhmsmobileapp/model/usermodel.dart';
import 'package:dhmsmobileapp/service/apicall.dart';
import 'package:meta/meta.dart';
import 'package:dhmsmobileapp/model/usermodel.dart';

part 'profilesection_event.dart';
part 'profilesection_state.dart';

class ProfilesectionBloc
    extends Bloc<ProfilesectionEvent, ProfilesectionState> {
  ProfilesectionBloc() : super(ProfilesectionInitialState()) {
    on<ProfileSectionBaseEvent>(profileSectionBaseEvent);
    on<NavigateToDashboardEvent>(navigateToDashboardEvent);
  }

  FutureOr<void> profileSectionBaseEvent(
      ProfileSectionBaseEvent event, Emitter<ProfilesectionState> emit) async {
    emit(GetProfileDetailsLoading());
    await Future.delayed(const Duration(seconds: 5));
    List<UserData> userdetails = [];
    try {
      final user = await getProfile();
      print(user);
      for (int i = 0; i < user.length; i++) {
        UserData post = UserData.fromJson(user[i] as Map<String, dynamic>);
        userdetails.add(post);
      }
      emit(AllProfileDetails(userdetails: userdetails));
    } catch (e) {
      print(e.toString());
    }
  }

  FutureOr<void> navigateToDashboardEvent(
      NavigateToDashboardEvent event, Emitter<ProfilesectionState> emit) {}
}
