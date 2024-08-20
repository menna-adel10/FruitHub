import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import '../errors/exceptions.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //return user
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'لقد قمت بالتسجيل مسبقا الرجاء تسجيل الدخول.');
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ ما الرجاء المحاولة مرة اخري');
      }
    } catch (e) {
      throw CustomException(message: 'لقد حدث خطأ ما الرجاء المحاولة مرة اخري');
    }
  }

  Future<User?> signInwithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      //get user print
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}");
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'الرقم السري او البريد الالكتروني غير صحيح');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'الرقم السري او البريد الالكتروني غير صحيح');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تاكد من اتصالك بالانترنت');
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ ما الرجاء المحاولة مرة اخري');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword :${e.toString()}");
    }
  }
}
