part of 'studentonboarding_bloc.dart';

sealed class StudentonboardingEvent extends Equatable {
  const StudentonboardingEvent();

  @override
  List<Object> get props => [];
}

class AllFieldsFilled extends StudentonboardingEvent {}

class StudentRegFailedEvent extends StudentonboardingEvent {}

class StudentSignupLoadingEvent extends StudentonboardingEvent {}

class StudentSignupSuccessEvent extends StudentonboardingEvent {}

class AllFieldsIncomplete extends StudentonboardingEvent {}

class SignupButtonPressed extends StudentonboardingEvent {
  final String student_phone;
  final String student_name;
  final String student_email;
  final String student_school;
  final String student_password;

  const SignupButtonPressed({
    required this.student_phone,
    required this.student_name,
    required this.student_email,
    required this.student_school,
    required this.student_password,
  });

  @override
  List<Object> get props => [
        student_phone,
        student_name,
        student_email,
        student_school,
        student_password,
      ];
}

class LoginButtonPressed extends StudentonboardingEvent {
  final String student_email;
  final String student_password;

  const LoginButtonPressed({
    required this.student_email,
    required this.student_password,
  });

  @override
  List<Object> get props => [
        student_email,
        student_password,
      ];
}
