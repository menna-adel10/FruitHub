import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/features/auth/views/widgets/terms_and_conditions.dart';

import '../../../../core/utils/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'dont_have_an_account.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  late bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            CustomTextField(
              hintText: 'الاسم كامل',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              hintText: 'البريد الإلكتروني',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              hintText: 'كلمة المرور',
            ),

            const SizedBox(
              height: 16,
            ),
            TermsAndConditions(),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              onPressed: () {},
              text: 'إنشاء حساب جديد',
            ),
            const SizedBox(
              height: 26,
            ),
            const DontHaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}
