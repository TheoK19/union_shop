import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/auth_page.dart';

void main() {
  group('AuthPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: AuthPage()));

      // Act
      final loginTab = find.text('Login');
      final signUpTab = find.text('Sign Up');

      // Assert
      expect(loginTab, findsOneWidget);
      expect(signUpTab, findsOneWidget);
    });
  });

  group('LoginForm', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: LoginForm()));

      // Act
      final emailField = find.widgetWithText(TextFormField, 'Email');
      final passwordField = find.widgetWithText(TextFormField, 'Password');
      final loginButton = find.widgetWithText(ElevatedButton, 'LOGIN');

      // Assert
      expect(emailField, findsOneWidget);
      expect(passwordField, findsOneWidget);
      expect(loginButton, findsOneWidget);
    });
  });

  group('SignUpForm', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: SignUpForm()));

      // Act
      final fullNameField =
          find.widgetWithText(TextFormField, 'Full Name');
      final emailField = find.widgetWithText(TextFormField, 'Email');
      final passwordField = find.widgetWithText(TextFormField, 'Password');
      final confirmPasswordField =
          find.widgetWithText(TextFormField, 'Confirm Password');
      final signUpButton = find.widgetWithText(ElevatedButton, 'SIGN UP');

      // Assert
      expect(fullNameField, findsOneWidget);
      expect(emailField, findsOneWidget);
      expect(passwordField, findsOneWidget);
      expect(confirmPasswordField, findsOneWidget);
      expect(signUpButton, findsOneWidget);
    });
  });
}
