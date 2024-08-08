import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/views/widgets/login_view_body.dart';
import '../../../core/widgets/custom_app_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'تسجيل الدخول'),
      body: const LoginViewBody(),
    );
  }


}
