// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:authority_tracker/config/route/route_names.dart';
import 'package:authority_tracker/core/usecases/auth_usecase.dart';
import 'package:authority_tracker/data/data_sources/user_cache.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthController extends AuthUsecase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool isloading = false;

  @override
  Future<void> login(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      isloading = true;
      var user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      )).user;
      if (user != null) {
        await UserCache.saveLogedIn(login: true, projectIdArg: user.uid);
        context.goNamed(AppRouteNames.homeScreen);
      } else {}
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } finally {
      isloading = false;
    }
  }

  /// Logout user
  @override
  Future<void> logout(BuildContext context) async {
    try {
      isloading = true;
      await _auth.signOut();
      await UserCache.clear();
      context.goNamed(AppRouteNames.login);
    } catch (e) {
      throw Exception("Logout failed: $e");
    } finally {
      isloading = false;
    }
  }

  /// Forgot password
  @override
  Future<void> forgotPassword(
    BuildContext context, {
    required String email,
  }) async {
    try {
      isloading = true;
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } finally {
      isloading = false;
    }
  }

  /// Signup user and store project details in Firestore
  @override
  Future<void> signUp(
    BuildContext context, {
    required String email,
    required String password,
    required String projectName,
  }) async {
    try {
      isloading = true;

      // Create user in FirebaseAuth
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = userCredential.user;

      if (user != null) {
        await _firestore.collection("projects").doc(user.uid).set({
          "projectId": user.uid,
          "email": email,
          "projectName": projectName,
          "createdAt": FieldValue.serverTimestamp(),
        });
        await UserCache.saveLogedIn(login: true, projectIdArg: user.uid);
        context.goNamed(AppRouteNames.homeScreen);
      } else {}
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      throw Exception(e.message);
    } finally {
      isloading = false;
    }
  }

  // Future test() async {
  //   try {
  //     var responce = await _firestore.collection('test').add({
  //       'test': 'just test',
  //     });
  //   } on FirebaseException catch (e) {
  //     log(e.message ?? 'null');
  //   }
  // }
}
