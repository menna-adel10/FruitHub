import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/persentation/manager/signin_cubit/signin_cubit.dart';
import 'package:fruit_hub/features/auth/views/widgets/sign_in_view_body_bloc_consumer.dart';
import '../../../core/services/get_it_service.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../domain/repos/auth-repo.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل الدخول'),
        body: SignInViewBodyBlocConsumer(),
      ),
    );
  }

}
