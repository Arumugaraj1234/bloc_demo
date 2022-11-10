import 'package:dartz/dartz.dart';
import 'package:unit_test_app/data/request/request.dart';
import 'package:unit_test_app/domain/entities/failure.dart';
import 'package:unit_test_app/domain/entities/request_otp.dart';

abstract class Repository {
  Future<Either<Failure, RequestOtp>> requestOtp(RequestOtpRequest request);
}
