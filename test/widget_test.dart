import 'package:alumini_job_refer_app/presentation/screens/homeScreen.dart';
import 'package:alumini_job_refer_app/presentation/screens/splashScreen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alumini_job_refer_app/main.dart';

void main() {
  testWidgets('Test MyApp widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp(
        isAuthenticated:
            false)); // or true if you want to test authenticated state

    // Verify that the SplashScreen is displayed initially.
    expect(find.byType(SplashScreen), findsOneWidget);
    expect(find.byType(HomeScreen), findsNothing);

    // If you want to test the authenticated state, you can simulate it by providing a token
    // MyApp(isAuthenticated: true);

    // If you want to test the navigation from SplashScreen to HomeScreen after authentication,
    // you can use tester.runAsync
    await tester.runAsync(() async {
      // Simulate authentication (e.g., by setting a token)
      // TokenHandler.setData('token', 'your_token_here');

      // Trigger a frame to allow Flutter to process the authentication
      await tester.pump();

      // Verify that the SplashScreen is removed and HomeScreen is displayed
      expect(find.byType(SplashScreen), findsNothing);
      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}
