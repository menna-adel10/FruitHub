import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/colors.dart';
import '../sign_up.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = (){
              Navigator.pop(context);
            },
            text: ' تمتلك حساب بالفعل؟ ',
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
            text: ' تسجيل الدخول ',
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
