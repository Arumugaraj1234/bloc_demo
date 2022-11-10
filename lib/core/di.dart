import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:unit_test_app/data/data_source/remote_data_source.dart';
import 'package:unit_test_app/data/network/app_api.dart';
import 'package:unit_test_app/data/network/dio_factory.dart';
import 'package:unit_test_app/data/network/network.dart';
import 'package:unit_test_app/data/repositiry/repository.dart';
import 'package:unit_test_app/domain/repository/repositiry.dart';
import 'package:unit_test_app/domain/usecase/request_otp_usecase.dart';

final instance = GetIt.instance;

Future<void> initModule() async {
  // Network
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // Dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  //App Service Client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //Data Source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  //Repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

void initRequestOtpModule() {
  bool isRequestOtpUseCaseRegistered =
      GetIt.I.isRegistered<RequestOtpUseCase>();
  if (!isRequestOtpUseCaseRegistered) {
    instance.registerFactory<RequestOtpUseCase>(
        () => RequestOtpUseCase(instance()));
  }
}
