import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/colors.dart';
import 'package:fruit_hub/core/utils/custom_button.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_text_field.dart';

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
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: ' لا تمتلك حساب؟ ',
                    style: TextStyles.semiBold16.copyWith(
                      color: Color(0xFF616A6B),
                    ),
                  ),
                  TextSpan(
                    text: '',
                    style: TextStyles.semiBold16.copyWith(
                      color: Color(0xFF616A6B),
                    ),
                  ),
                  TextSpan(
                    text: ' قم بانشاء حساب ',
                    style: TextStyles.semiBold16.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
