import 'package:dartz/dartz.dart';
import 'package:unit_test_app/data/data_source/remote_data_source.dart';
import 'package:unit_test_app/data/network/network.dart';
import 'package:unit_test_app/data/request/request.dart';
import 'package:unit_test_app/data/responses/responses.dart';
import 'package:unit_test_app/domain/entities/failure.dart';
import 'package:unit_test_app/domain/entities/request_otp.dart';
import 'package:unit_test_app/domain/repository/repositiry.dart';
import 'package:unit_test_app/data/mapper/mapper.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, RequestOtp>> requestOtp(
      RequestOtpRequest request) async {
    bool hasConnection = await _networkInfo.isConnected;

    if (hasConnection) {
      RequestOtpResponse response = await _remoteDataSource.requestOtp(request);
      if (response.status == 1) {
        return Right(response.getEntity());
      } else {
        return Left(Failure(0, response.message ?? "Default message"));
      }
    } else {
      return Left(Failure(0, "No Internet Connection"));
    }
  }
}
