import 'package:authority_tracker/core/usecases/auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends AuthUsecase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool isloading = false;

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      isloading = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } finally {
      isloading = false;
    }
  }

  /// Logout user
  @override
  Future<void> logout() async {
    try {
      isloading = true;
      await _auth.signOut();
    } catch (e) {
      throw Exception("Logout failed: $e");
    } finally {
      isloading = false;
    }
  }

  /// Forgot password
  @override
  Future<void> forgotPassword({required String email}) async {
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
  Future<void> signUp({
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
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } finally {
      isloading = false;
    }
  }
}
