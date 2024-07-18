import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dhmsmobileapp/utils/api_client.dart';
import 'package:equatable/equatable.dart';

part 'studentonboarding_event.dart';
part 'studentonboarding_state.dart';

class StudentonboardingBloc
    extends Bloc<StudentonboardingEvent, StudentonboardingState> {
  final ApiClient apiService;

  StudentonboardingBloc(this.apiService) : super(StudentSignupInitial()) {
    on<StudentonboardingEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SignupButtonPressed>(_signupButtonPressed);
    on<AllFieldsFilled>(_allFieldsFilled);
    on<AllFieldsIncomplete>(_allFieldsIncomplete);
    on<StudentRegFailedEvent>(_studentRegFailedEvent);
    on<StudentSignupLoadingEvent>(_studentSignupLoadingEvent);
    on<StudentSignupSuccessEvent>(_studentSignupSuccessEvent);
    on<LoginButtonPressed>(_loginButtonPressed);
  }

  FutureOr<void> _signupButtonPressed(
      SignupButtonPressed event, Emitter<StudentonboardingState> emit) async {
    emit(StudentSignupLoading());
    Future.delayed(const Duration(seconds: 10));
    try {
      final response = await apiService.registerUser({
        'student_phone': event.student_phone,
        'student_name': event.student_name,
        'student_email': event.student_email,
        'student_school': event.student_school,
        'student_password': event.student_password,
      });
      print(response.data);
      if (response.data['status'] == 200) {
        emit(StudentSignupSuccess());
      } else {
        emit(StudentSignupFailure(
            error: response.data['message'] ?? 'Unknown error during signup'));
        print('response.statusMessage');
      }
    } catch (error) {
      emit(StudentSignupFailure(error: error.toString()));
      print(error.toString());
    }
  }

  FutureOr<void> _allFieldsFilled(
      AllFieldsFilled event, Emitter<StudentonboardingState> emit) async {
    emit(AllFieldsAreFilled());
  }

  FutureOr<void> _allFieldsIncomplete(
      AllFieldsIncomplete event, Emitter<StudentonboardingState> emit) async {
    emit(AllFieldsAreIncomplete());
  }

  FutureOr<void> _studentRegFailedEvent(
      StudentRegFailedEvent event, Emitter<StudentonboardingState> emit) async {
    // emit(const StudentSignupFailure(
    //     error: 'An error occured with student signup form'));
    emit(NewStudentSignupFailure());
    print('student signup failed');
    Future.delayed(const Duration(seconds: 10));
    // NewStudentSignupFailure
    emit(StudentSignupInitial());
  }

  FutureOr<void> _studentSignupLoadingEvent(StudentSignupLoadingEvent event,
      Emitter<StudentonboardingState> emit) async {
    Future.delayed(const Duration(seconds: 5));
    emit(StudentSignupInitial());
  }

  FutureOr<void> _studentSignupSuccessEvent(
      StudentSignupSuccessEvent event, Emitter<StudentonboardingState> emit) {}

  FutureOr<void> _loginButtonPressed(
      LoginButtonPressed event, Emitter<StudentonboardingState> emit) async {
    print('login event triggered');
    emit(StudentLoginLoading());
    Future.delayed(const Duration(seconds: 10));
    var ErrorMessage;
    try {
      final response = await apiService.StudentLogin({
        'email': event.student_email,
        'password': event.student_password,
      });
      print('response');
      print(response.statusMessage);
      ErrorMessage = response.statusMessage;
      if (response.data['status'] == 200) {
        emit(StudentLoginLoading());
        Future.delayed(const Duration(seconds: 5));
        emit(StudentLoginSuccess());
      } else {
        print(response.statusMessage);
        emit(StudentLoginFailure(error: response.data['message']));
        // print(response.data['message']);
      }
    } catch (error) {
      emit(StudentLoginFailure(error: ErrorMessage.toString()));
      // emit(StudentSignupFailure(error: error.toString()));
      // print(error.toString());
    }
  }
}
