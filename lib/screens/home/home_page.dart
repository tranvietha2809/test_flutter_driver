import 'package:flutter/material.dart';
import 'package:test_flutter_driver/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: HOME),
      builder: (_) => const HomePage()
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      key: Key('homepage'),
      body: Center(
        child: Text(
          "HOME",
          key: Key('home-title')
        ),
      ),
    );
  }
}
