import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:unit_test_app/core/constants.dart';
import 'package:unit_test_app/data/responses/responses.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio) = _AppServiceClient;

  @POST("RequestOTP")
  Future<RequestOtpResponse> requestOtp(@Field("phone_no") String phoneNumber);
}
