import 'package:flutter/material.dart';
import 'package:unit_test_app/core/di.dart';
import 'package:unit_test_app/features/pages/request_otp_view.dart';
import 'package:unit_test_app/features/pages/splash_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String requestOtpRoute = "/requestOtpRoute";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.requestOtpRoute:
        initRequestOtpModule();
        return MaterialPageRoute(builder: (_) => const RequestOtpView());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    final undefinedWidget = Scaffold(
      appBar: AppBar(
        title: const Text("Page not found"),
      ),
      body: const Center(
        child: Text("Page not found"),
      ),
    );

    return MaterialPageRoute(builder: (_) => undefinedWidget);
  }
}
