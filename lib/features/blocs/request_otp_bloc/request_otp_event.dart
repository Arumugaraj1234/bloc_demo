part of 'request_otp_bloc.dart';

abstract class RequestOtpEvent extends Equatable {
  const RequestOtpEvent();

  @override
  List<Object?> get props => [];
}

class PhoneNumberInputEvent extends RequestOtpEvent {
  final String phoneNumber;

  const PhoneNumberInputEvent({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}

class ContinueButtonPressedEvent extends RequestOtpEvent {
  final String phoneNumber;

  const ContinueButtonPressedEvent({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}
