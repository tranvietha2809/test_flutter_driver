import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_flutter_driver/repositories/login/login_repository.dart';
import 'package:test_flutter_driver/route_generator.dart';
import 'package:test_flutter_driver/screens/login/login_page.dart';

import 'mocks/widget_test.mocks.dart';

void setupMockDI() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<LoginRepository>(MockLoginRepository());
}

void main() {
  runApp(Builder(
    builder: (_) {
      setupMockDI();
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}