import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/services/firebase_auth_services.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth-repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoImpl({required this.firebaseAuthServices});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFireBaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
class BackEndAuthRepoImpl extends AuthRepo{
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(String email, String password, String name) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }
  
}