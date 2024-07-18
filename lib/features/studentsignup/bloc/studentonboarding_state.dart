part of 'studentonboarding_bloc.dart';

sealed class StudentonboardingState extends Equatable {
  const StudentonboardingState();

  @override
  List<Object> get props => [];
}

class StudentSignupInitial extends StudentonboardingState {}

class StudentSignupLoading extends StudentonboardingState {}

class StudentLoginLoading extends StudentonboardingState {}

class StudentLoginSuccess extends StudentonboardingState {}

class StudentSignupSuccess extends StudentonboardingState {}

class StudentSignupFailure extends StudentonboardingState {
  final String error;

  const StudentSignupFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class StudentLoginFailure extends StudentonboardingState {
  final String error;

  const StudentLoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class NewStudentSignupFailure extends StudentonboardingState {}

class AllFieldsAreFilled extends StudentonboardingState {}

class AllFieldsAreIncomplete extends StudentonboardingState {}
