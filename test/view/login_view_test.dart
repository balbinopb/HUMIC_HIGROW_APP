import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:higrow/views/dashboard/dashboard_screen.dart';
import 'package:higrow/views/login/login_screen.dart';

void main() {
  testWidgets('LoginScreen UI and navigation test', (WidgetTester tester) async {
    // Build the LoginScreen widget inside a MaterialApp
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // Verify logo image is present
    expect(find.byType(Image), findsOneWidget);

    // Verify the login title text
    expect(find.text('Login to your account'), findsOneWidget);

    // Verify input fields
    expect(find.widgetWithText(TextField, 'Username'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Password'), findsOneWidget);

    // Verify login button
    final loginButton = find.widgetWithText(ElevatedButton, 'Log In');
    expect(loginButton, findsOneWidget);

    // Tap the login button
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // Should navigate to DashboardScreen
    expect(find.byType(DashboardScreen), findsOneWidget);
  });

  testWidgets('LoginScreen Sign Up button is present', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // Verify "Don't have an account?" text
    expect(find.text("Don't have an account?"), findsOneWidget);

    // Verify Sign Up button
    final signUpButton = find.widgetWithText(TextButton, 'Sign Up');
    expect(signUpButton, findsOneWidget);
  });
}
