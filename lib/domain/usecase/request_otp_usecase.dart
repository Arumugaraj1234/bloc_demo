import 'package:dartz/dartz.dart';
import 'package:unit_test_app/data/request/request.dart';
import 'package:unit_test_app/domain/entities/failure.dart';
import 'package:unit_test_app/domain/entities/request_otp.dart';
import 'package:unit_test_app/domain/repository/repositiry.dart';
import 'package:unit_test_app/domain/usecase/base_usecase.dart';

class RequestOtpUseCase extends BaseUseCase<RequestOtpRequest, RequestOtp> {
  final Repository _repository;

  RequestOtpUseCase(this._repository);

  @override
  Future<Either<Failure, RequestOtp>> call(RequestOtpRequest request) async {
    return await _repository.requestOtp(request);
  }
}
