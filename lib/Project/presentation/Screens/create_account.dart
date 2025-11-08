import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Colors/colors_screens.dart';
import '../Component/container.dart';
import '../Component/dialog.dart';
import '../Component/row_textField.dart';
import '../Component/text_top.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsScreens.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          children: [
            SizedBox(height: 70.h),
            SvgPicture.asset('assets/Logo/logos.svg'),

            SizedBox(height: 30.h),

            Padding(
              padding: EdgeInsets.only(left: 60.w),
              child: TextTop(
                text: 'تحقق من بريدك الإلكتروني         ',
                size: 20.sp,
              ),
            ),
            SizedBox(height: 8.h),

            Padding(
              padding: EdgeInsets.only(left: 60.w),
              child: Text(
                'تحقق من صندوق الوارد و أدخل الرمز المكون من 6أرقام\nلإكمال التسجيل',
                style: TextStyle(color: ColorsScreens.grey, fontSize: 12.sp),
                textAlign: TextAlign.end,
              ),
            ),

            SizedBox(height: 50.h),
            MyForm(),
            SizedBox(height: 90.h),
            ContainerComponent(
              textContainer: 'تأكيد',
              onTap: () {
                ShowDialog.showCustomDialog(context);
                // Navigator to home
              },
            ),
          ],
        ),
      ),
    );
  }
}
