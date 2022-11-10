import 'package:flutter/material.dart';
import 'package:unit_test_app/core/resources/app_colors.dart';
import 'package:unit_test_app/core/resources/app_routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Demo",
      theme: ThemeData(primaryColor: AppColors.darkOrange),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
