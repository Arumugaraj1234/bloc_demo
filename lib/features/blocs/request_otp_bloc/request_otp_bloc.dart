import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unit_test_app/data/request/request.dart';
import 'package:unit_test_app/domain/entities/failure.dart';
import 'package:unit_test_app/domain/entities/request_otp.dart';
import 'package:unit_test_app/domain/usecase/request_otp_usecase.dart';

part 'request_otp_event.dart';
part 'request_otp_state.dart';

class RequestOtpBloc extends Bloc<RequestOtpEvent, RequestOtpState> {
  final RequestOtpUseCase requestOtpUseCase;

  RequestOtpBloc({required this.requestOtpUseCase})
      : super(RequestOtpState.initial()) {
    on<PhoneNumberInputEvent>(_emailError);
    on<ContinueButtonPressedEvent>(_requestOtp);
  }

  void _emailError(PhoneNumberInputEvent event, Emitter<RequestOtpState> emit) {
    String? phoneNumberError =
        event.phoneNumber.length == 10 ? null : "Invalid phone number";
    emit(state.copyWith(phoneNumberError: phoneNumberError));
  }

  void _requestOtp(
      ContinueButtonPressedEvent event, Emitter<RequestOtpState> emit) async {
    emit(state.copyWith(requestOtpStatus: RequestOtpStatus.loading));
    String phoneNumber = event.phoneNumber;
    RequestOtpRequest request = RequestOtpRequest(phoneNumber);
    (await requestOtpUseCase.call(request)).fold((failure) {
      emit(state.copyWith(
          failure: failure, requestOtpStatus: RequestOtpStatus.error));
    }, (data) {
      emit(state.copyWith(
          requestOtpStatus: RequestOtpStatus.success, requestOtp: data));
    });
  }
}
