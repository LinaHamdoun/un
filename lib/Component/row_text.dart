import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Colors/colors_screens.dart';

class TextRow extends StatelessWidget {
  final String text;

  final String textButton;

  final void Function() onTap;

  TextRow({
    super.key,
    required this.text,
    required this.textButton,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Text(
            textButton,
            style: TextStyle(color: ColorsScreens.amber, fontSize: 10.sp),
          ),
        ),

        Text(
          text,
          style: TextStyle(color: ColorsScreens.grey, fontSize: 10.sp),
        ),
      ],
    );
  }
}
