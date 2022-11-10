import 'package:unit_test_app/data/network/app_api.dart';
import 'package:unit_test_app/data/request/request.dart';
import 'package:unit_test_app/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<RequestOtpResponse> requestOtp(RequestOtpRequest request);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<RequestOtpResponse> requestOtp(RequestOtpRequest request) async {
    return await _appServiceClient.requestOtp(request.phoneNumber);
  }
}
