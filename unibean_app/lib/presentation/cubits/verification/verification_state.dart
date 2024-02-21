part of 'verification_cubit.dart';

sealed class VerificationState extends Equatable {
  const VerificationState();
}

final class VerificationInitial extends VerificationState {
  @override
  List<Object> get props => [];
}

final class VerificationInProcess extends VerificationState {
  @override
  List<Object> get props => [];
}

final class OTPVerificationSuccess extends VerificationState {
  @override
  List<Object> get props => [];
}

final class OTPVerificationFailed extends VerificationState {
  @override
  List<Object> get props => [];
}
