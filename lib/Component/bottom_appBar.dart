




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Colors/colors_screens.dart';
import '../Pages/scanner_screen.dart';
import 'gestureDetector_icon.dart';

class BottomApp extends StatelessWidget {
  const BottomApp({
    super.key,
    required this.screenW,
  });

  final double screenW;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Spacer(flex: 1),
            Container(height: 2.h, color: Color(0xFFD4AF37)),
            Container(
              height: 70.h,
              color: ColorsScreens.black,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: IconSelectorExample(),
            ),
          ],
        ),



        Positioned(
          bottom: 18.h,
          left: (screenW / 2) - (72.w / 2),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BarcodeScannerPage()),
              );
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
          ),
        ),




      ],
    );
  }
}