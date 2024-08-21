import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/views/widgets/signin_view_body.dart';
import '../../../../core/widgets/custom_progress_hud.dart';
import '../../persentation/manager/signin_cubit/signin_cubit.dart';
import '../../persentation/manager/signin_cubit/signin_state.dart';

BlocConsumer<SignInCubit, SignInState> SignInViewBodyBlocConsumer() {
  return BlocConsumer<SignInCubit, SignInState>(
    listener: (context, state) {},
    builder: (context, state) {
      return CustomProgressHud(
          isLoading: state is SignInLoading ? true : false,
          child: const SignInViewBody());
    },
  );
}













