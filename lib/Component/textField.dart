import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Component/validator.dart';

import '../Colors/colors_screens.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({
    super.key,
    required this.text,
    required this.controller,
    required this.validator,
    required this.focusNode,
  });

  final TextEditingController controller;
  final String text;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 12.sp, color: ColorsScreens.grey),
          textAlign: TextAlign.end,
        ),
        SizedBox(height: 4.h),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: buildOutlineInputBorder(1.w),
            enabledBorder: buildOutlineInputBorder(1.w),
            focusedBorder: buildOutlineInputBorder(2.w),
            errorStyle: TextStyle(
              color: Colors.redAccent,
              fontSize: 13.sp,
              height: 1.2,
            ),
          ),
          validator: validator ?? (value) => CustomValidators.required(value),
          focusNode: focusNode,
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder(double width) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: ColorsScreens.grey, width: width),
    );
  }
}
