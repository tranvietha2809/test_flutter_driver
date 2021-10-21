import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_flutter_driver/main_test.dart' as app;
import 'package:test_flutter_driver/repositories/login/login_repository.dart';

import '../mock_helper.dart';

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('login flow test', () {
    tearDownAll(() {
      GetIt.instance.reset();
    });

    testWidgets('Do normal login', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      // Verify you are at login page.
      expect(find.byKey(const Key("login-page")), findsOneWidget);

      // Finds the username textField.
      final usernameField = find.byKey(const Key('username-text-field'));

      // Emulate fill username.
      await tester.enterText(usernameField, 'test0819@test.com');

      // Emulate fill password.
      final passwordField = find.byKey(const Key('password-text-field'));
      await tester.enterText(passwordField, 'test123');

      final loginButton = find.byKey(const Key('login-button'));
      MockHelper.login();
      await tester.tap(loginButton);
      // Trigger a frame.
      await tester.pumpAndSettle();
      // Verify you are in Home Page.
      expect(find.text('HOME'), findsOneWidget);
    });
  });

  testWidgets('Do failed login', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Verify you are at login page.
    expect(find.byKey(const Key("login-page")), findsOneWidget);

    // Finds the username textField.
    final usernameField = find.byKey(const Key('username-text-field'));

    // Emulate fill username.
    await tester.enterText(usernameField, 'test');

    // Emulate fill password.
    final passwordField = find.byKey(const Key('password-text-field'));
    await tester.enterText(passwordField, 'test');

    final loginButton = find.byKey(const Key('login-button'));
    when(GetIt.instance<LoginRepository>().login("test", "test"))
        .thenAnswer((realInvocation) async {
      return false;
    });
    await tester.tap(loginButton);
    // Trigger a frame.
    await tester.pumpAndSettle();
    // Verify you are in Login Page.
    expect(find.byKey(const Key("login-page")), findsOneWidget);
  });
}
