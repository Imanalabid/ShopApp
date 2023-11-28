import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/Colors.dart';

TextField reusableTextField(
    String text,
    IconData icon,
    bool isPasswordType,
    TextEditingController controller,
    ) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: isPasswordType,
    autocorrect: isPasswordType,
    cursorColor: AppColors.Icon1Color,
    style: TextStyle(
      color: AppColors.smalltextfontColor,
      fontFamily: 'Manrope',
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(icon, color: Colors.blue.shade700),
      labelText: text,
      labelStyle: TextStyle(
        color: Colors.grey.withOpacity(0.9),
        fontSize: 18.sp,
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      // Add the border with a specific radius without color
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none
      ),
    ),
    onChanged: (value) {},
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
