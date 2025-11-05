import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Colors/colors_screens.dart';
import 'click_column.dart';

class BottomApp extends StatelessWidget {
  const BottomApp({
    super.key,
    required this.screenW,
    required this.current,
    required this.onTap,
  });

  final Function(int) onTap;
  final double screenW;
  final int current;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 2.h, color: Color(0xFFD4AF37)),
          Container(
            color: ColorsScreens.black,
            padding: EdgeInsets.only(left: 0, right: 0, top: 10.h),
            child: Row(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,


                  onTap: () => onTap(0),
                
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24 , right: 40),
                    child: ClickColumn(
                      nameScreen: 'Main',
                      icon: Icons.home,
                      onTap: () => onTap(0),
                      isSelected: current == 0,
                    ),
                  ),
                ),
                Spacer(flex: 1,),
                GestureDetector(
                  onTap: () => onTap(1),
                  behavior: HitTestBehavior.opaque,


                  child: Padding(
                    padding: const EdgeInsets.only(right: 24 , left: 40),
                    child: ClickColumn(
                      nameScreen: 'Personal',
                      icon: Icons.person_rounded,
                      onTap: () => onTap(1),
                      isSelected: current == 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
