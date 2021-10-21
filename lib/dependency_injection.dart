import 'package:get_it/get_it.dart';
import 'package:test_flutter_driver/repositories/login/login_repository.dart';
import 'package:test_flutter_driver/repositories/login/login_repository_impl.dart';

void setup () {
  final getIt = GetIt.instance;
  getIt.registerSingleton<LoginRepository>(LoginRepositoryImpl());
}