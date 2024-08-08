import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/views/sign_up.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/colors.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = (){
              Navigator.pushNamed(context, SignUpView.routeName);
            },
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
            recognizer: TapGestureRecognizer()..onTap = (){
              Navigator.pushNamed(context, SignUpView.routeName);
            },
            text: ' قم بانشاء حساب ',
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
