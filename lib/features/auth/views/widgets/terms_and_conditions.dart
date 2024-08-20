import 'package:flutter/material.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/colors.dart';
import 'custom_check_box.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            setState(() {
              isTermsAccepted = value;
              widget.onChanged(value);
              setState(() {

              });
            });
          },
          isChecked: isTermsAccepted,
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: 'من خلال انشاء حساب, فانك توافق علي ',
              style: TextStyles.semiBold13.copyWith(
                color: Color(0xFF949D9E),
              ),
              children: [
                TextSpan(
                  text: ' الشروط والاحكام الخاصة بنا',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: TextStyles.semiBold13,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
