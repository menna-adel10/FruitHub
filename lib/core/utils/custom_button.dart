import 'package:flutter/material.dart';
import '../../constants.dart';
import 'app_text_styles.dart';
import 'colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SizedBox(
        width: double.infinity,
        height :54,
        child: TextButton(

          style: TextButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style:TextStyles.bold16.copyWith(color: Colors.white),

          ),
        ),
      ),
    );
  }
}
