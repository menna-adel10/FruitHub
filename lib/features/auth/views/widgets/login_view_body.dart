import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/colors.dart';
import 'package:fruit_hub/core/utils/custom_button.dart';
import 'package:fruit_hub/features/auth/views/widgets/social_login_button.dart';
import 'package:fruit_hub/features/auth/views/widgets/or_divider.dart';
import '../../../../core/utils/app_images.dart';
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
              TextInputField: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              hintText: 'كلمة المرور',
              TextInputField: TextInputType.visiblePassword,
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
            SizedBox(
              height: 33,
            ),
            SocialLoginButton(
                image: Assets.imagesGoogleIcon,
                title: 'تسجيل بواسطة جوجل',
                onPressed: () {}),
            SizedBox(
              height: 16,
            ),
            SocialLoginButton(
                image: Assets.imagesAppleIcon,
                title: 'تسجيل بواسطة فيس بوك',
                onPressed: () {}),
            SizedBox(
              height: 16,
            ),
            SocialLoginButton(
                image: Assets.imagesFaceBookIcon,
                title: 'تسجيل بواسطة فيس بوك',
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
