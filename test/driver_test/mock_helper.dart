import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test_driver_extended.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_flutter_driver/repositories/login/login_repository.dart';
import 'package:test_flutter_driver/repositories/login/login_repository_impl.dart';

@GenerateMocks([LoginRepository])
class MockHelper {
  static void login() {
    when(GetIt.instance<LoginRepository>().login('test0819@test.com', 'test123'))
        .thenAnswer((realInvocation) async => true);
  }

  static void loginFailed() {
    when(GetIt.instance<LoginRepository>().login("test", "test"))
        .thenAnswer((realInvocation) async {
      return false;
    });
  }
}
