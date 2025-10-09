import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Colors/colors_screens.dart';

class ContainerComponent extends StatelessWidget {
  ContainerComponent({
    super.key,
    required this.textContainer,
    required this.onTap,
  });

  static double heightContainer = 50.h;

  double heightText = 20.sp;

  String textContainer;

  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: double.infinity,
        height: heightContainer,
        decoration: BoxDecoration(
          color: ColorsScreens.amber,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: SizedBox(
            height: heightText,
            child: Text(
              textContainer,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
