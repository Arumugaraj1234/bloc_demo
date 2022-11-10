import 'package:unit_test_app/data/responses/responses.dart';
import 'package:unit_test_app/domain/entities/request_otp.dart';

extension RequestOtpMapperExt on RequestOtpResponse {
  RequestOtp getEntity() => RequestOtp(status ?? 0, message ?? "Something went wrong", name ?? "");
}