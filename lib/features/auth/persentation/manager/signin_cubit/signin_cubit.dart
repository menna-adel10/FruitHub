import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth-repo.dart';
import 'package:fruit_hub/features/auth/persentation/manager/signin_cubit/signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

  final AuthRepo authRepo;

  Future<void> signIn(String email, String password) async {
    emit(SignInLoading());
    var result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(SignInFailure(message: failure.message)),
      (userEntity) => emit(SignInSuccess(userEntity: userEntity)),
    );
  }
}
