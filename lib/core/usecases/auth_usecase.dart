import 'package:flutter/material.dart';

abstract class AuthUsecase extends ChangeNotifier {
  Future<void> login(
    BuildContext context, {
    required String email,
    required String password,
  });
  Future<void> signUp(
    BuildContext context, {
    required String email,
    required String password,
    required String projectName,
  });
  Future<void> forgotPassword(BuildContext context, {required String email});
  Future<void> logout(BuildContext context);
}
