import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/colors.dart';
import 'package:fruit_hub/core/utils/custom_button.dart';
import 'package:fruit_hub/features/auth/views/widgets/or_divider.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'dont_have_an_account.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            CustomTextField(
              hintText: 'البريد الاكتروني',
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              hintText: 'كلمة المرور',
              icon: Icon(
                Icons.remove_red_eye_rounded,
                color: Color(0xffC9CECF),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyles.semiBold13
                      .copyWith(color: AppColors.lightPrimaryColor),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
            SizedBox(
              height: 33,
            ),
            CustomButton(onPressed: () {}, text: 'تسجيل دخول'),
            SizedBox(
              height: 33,
            ),
            DontHaveAnAccountWidget(),
            SizedBox(
              height: 33,
            ),
            OrDivider(),
          ],
        ),
      ),
    );
  }
}
