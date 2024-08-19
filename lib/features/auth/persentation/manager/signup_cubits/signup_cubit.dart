import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth-repo.dart';
import 'package:fruit_hub/features/auth/persentation/manager/signup_cubits/signup_state.dart';

class SignupCubit extends Cubit<SignupState>{
  SignupCubit(this.authRepo) : super(SignupInitial());

    final AuthRepo authRepo;

    Future<void> createUserWithEmailAndPassword(
        String email,String password, String name)async{
      emit(SignupLoading());
      final result = await authRepo.createUserWithEmailAndPassword(email, password, name);
      result.fold(
          (failure)=> emit(SignupFailure(message: failure.message)),
          (userEntity)=> emit(SignupSuccess(userEntity: userEntity)),
      );
    }
}
