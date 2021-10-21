import 'package:test_flutter_driver/repositories/login/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository{
  @override
  Future<bool> login(String username, String password) async{
    return true;
  }
}

