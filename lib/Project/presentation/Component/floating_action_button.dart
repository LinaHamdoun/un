import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Project/domain/models/question_model.dart';

import '../Screens/scanner_screen.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       context.pushPage (   BarcodeScannerPage());

      },
      child: Container(
        width: 72.w,
        height: 72.h,
        decoration: BoxDecoration(
          color: Color(0xFFD4AF37),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 4.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 6.r,
              offset: Offset(0, 3.h),
            ),
          ],
        ),
        child: Icon(Icons.add, color: Colors.white, size: 30.h),
      ),
    );
  }
}
