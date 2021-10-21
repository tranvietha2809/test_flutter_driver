import 'package:flutter/material.dart';
import 'package:test_flutter_driver/dependency_injection.dart';
import 'package:test_flutter_driver/route_generator.dart';
import 'package:test_flutter_driver/screens/login/login_page.dart';

void main() {
  runApp(Builder(
    builder: (_) {
      setup();
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
