import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:higrow/views/login/login_screen.dart';
import 'package:higrow/views/register/register_screen.dart';

void main() {
  testWidgets('RegisterScreen UI and navigation test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: RegisterScreen()));

    // Logo image
    expect(find.byType(Image), findsOneWidget);

    // Title text
    expect(find.text('Create New Account'), findsOneWidget);

    // Input fields
    expect(find.widgetWithText(TextField, 'Username'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Email'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Password'), findsOneWidget);

    // Create Account button
    final createAccountButton = find.widgetWithText(ElevatedButton, 'Create Account');
    expect(createAccountButton, findsOneWidget);

    // Tap Create Account and navigate to LoginScreen
    await tester.tap(createAccountButton);
    await tester.pumpAndSettle();
    expect(find.byType(LoginScreen), findsOneWidget);
  });

  testWidgets('RegisterScreen "Log In" button navigates to LoginScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: RegisterScreen()));

    // Check for "Have an account?" text
    expect(find.text("Have an account?"), findsOneWidget);

    // Tap "Log In" button
    final loginButton = find.widgetWithText(TextButton, 'Log In');
    expect(loginButton, findsOneWidget);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // Verify navigation to LoginScreen
    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
