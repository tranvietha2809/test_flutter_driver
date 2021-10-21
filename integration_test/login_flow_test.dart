import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_flutter_driver/main.dart' as app;

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('login flow test', () {
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
      // MockHelper.login();
      await tester.tap(loginButton);
      // Trigger a frame.
      await tester.pumpAndSettle();
      // Verify you are in Home Page.
      expect(find.text('HOME'), findsOneWidget);
    });
  });
}
