import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../features/auth/data/models/user_model.dart';
import '../../features/auth/domain/entities/user_entity.dart';
import '../errors/exceptions.dart';
import '../errors/failures.dart';

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

  Future<User> signInWithEmailAndPassword(
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
      throw CustomException(message: 'لقد حدث خطأ ما الرجاء المحاولة مرة اخري');

    }
  }
  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
}



/*

  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthServices.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما، الرجاء المحاولة مرة أخرى',
        ),
      );
    }
  }
 */