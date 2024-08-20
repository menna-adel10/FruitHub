import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/auth/persentation/manager/signup_cubits/signup_state.dart';
import 'package:fruit_hub/features/auth/views/widgets/sign_up_view_body.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth-repo.dart';
import '../persentation/manager/signup_cubits/signup_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = 'sign up';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'حساب جديد',
        ),
        body: SignupViewBlocConsumer(),
      ),
    );
  }
}

class SignupViewBlocConsumer extends StatelessWidget {
  const SignupViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {},
        builder: (context, state) {
          return const SignupViewBody();
        });
  }
}
