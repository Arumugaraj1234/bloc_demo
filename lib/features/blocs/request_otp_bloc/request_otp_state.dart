part of 'request_otp_bloc.dart';

enum RequestOtpStatus { initial, loading, success, error }

class RequestOtpState extends Equatable {
  final String? phoneNumberError;
  final RequestOtpStatus requestOtpStatus;
  final RequestOtp? requestOtp;
  final Failure? failure;

  const RequestOtpState(
      {this.phoneNumberError,
      required this.requestOtpStatus,
      this.requestOtp,
      this.failure});

  factory RequestOtpState.initial() {
    return const RequestOtpState(
        phoneNumberError: null,
        requestOtpStatus: RequestOtpStatus.initial,
        requestOtp: null,
        failure: null);
  }

  RequestOtpState copyWith(
      {String? phoneNumberError,
      RequestOtpStatus? requestOtpStatus,
      RequestOtp? requestOtp,
      Failure? failure}) {
    return RequestOtpState(
        phoneNumberError: phoneNumberError,
        requestOtpStatus: requestOtpStatus ?? this.requestOtpStatus,
        requestOtp: requestOtp,
        failure: failure);
  }

  @override
  List<Object?> get props =>
      [phoneNumberError, requestOtpStatus, requestOtp, failure];
}
