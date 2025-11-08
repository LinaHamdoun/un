import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/Project/presentation/Component/text_top.dart';
import 'package:untitled/Project/presentation/Screens/login_screen.dart';

import '../Colors/colors_screens.dart';


class ShowDialog {
  static void showCustomDialog(BuildContext context) {
    showDialog(
      barrierColor: ColorsScreens.black,
      barrierDismissible: true,
      context: context,
      builder: (context) {

        Future.delayed(Duration(seconds: 2),
          () {

            Navigator.of(context).pop();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) =>  LogIn()),
        );
      });








    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/Logo/checke.svg',
                width: 100.w,
                height: 100.h,
              ),

              SizedBox(height: 20.h),
              TextTop(text: 'تم إرسال طلبك', size: 20.sp),

              Text(
                'طلبك قيد المعالجة من قبل المدير',
                style: TextStyle(color: ColorsScreens.grey),
              ),
            ],
          ),
        ),
      );






      }
    );


  }
}
