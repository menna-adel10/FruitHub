import 'package:flutter/material.dart';
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
    );
  }
}
