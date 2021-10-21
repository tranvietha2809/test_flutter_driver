import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_flutter_driver/repositories/login/login_repository.dart';
import 'package:test_flutter_driver/repositories/login/login_repository_impl.dart';
import 'package:test_flutter_driver/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: LOGIN),
        builder: (context) => const LoginPage());
  }
}

class _LoginPageState extends State<LoginPage> {
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key("login-page"),
      body: Center(
        child: Form(
          key: const Key("login-form"),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                key: const Key("username-text-field"),
                controller: usernameTextController,
              ),
              TextFormField(
                obscureText: true,
                obscuringCharacter: '*',
                key: const Key("password-text-field"),
                controller: passwordTextController,
              ),
              ElevatedButton(
                  key: const Key('login-button'),
                  onPressed: () async {
                   final result = await GetIt.instance<LoginRepository>().login(usernameTextController.text, passwordTextController.text);
                   if(result){
                     Navigator.of(context).pushNamed(HOME);
                   }
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
