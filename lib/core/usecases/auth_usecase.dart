import 'package:flutter/material.dart';

abstract class AuthUsecase extends ChangeNotifier {
  Future<void> login({required String email, required String password});
  Future<void> signUp({
    required String email,
    required String password,
    required String projectName,
  });
  Future<void> forgotPassword({required String email});
  Future<void> logout();
}
