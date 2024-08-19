import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, this.TextInputField, this.icon, this.onSaved});

  final String hintText;
  final TextInputField;
  final Widget? icon;

  final void Function(String?)?onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value){
        if(value == null|| value.isEmpty){
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: TextInputField,
      decoration: InputDecoration(
        suffixIcon: icon,
        hintStyle: TextStyles.bold13.copyWith(
          color: Color(0xFF949D9E),
        ),
        hintText: hintText,
        filled: true,
        fillColor: Color(0xFFF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
      width: 1,
      color: Color(0xFFE6E9E9),
    ));
  }
}
