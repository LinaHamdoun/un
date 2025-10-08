import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Colors/colors_screens.dart';

class ContainerMyOwn extends StatelessWidget {
  const ContainerMyOwn({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: ColorsScreens.black,
        border: Border.all(color: ColorsScreens.grey),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,

          children: children,
        ),
      ),
    );
  }

  static Padding buildPadding(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 10, right: 5, bottom: 10),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class TextAndIcon extends StatelessWidget {
  const TextAndIcon({
    super.key,
    required this.onTap,
    required this.txt,
     this.icon,
    this.icon2

  });

  final void Function()? onTap;
  final String txt;

  final IconData ? icon;
  final IconData ? icon2;



  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            buildIcon(),
            SizedBox(width: 7.w),
            GestureDetector(
              onTap: onTap,
              child: Text(
                txt,
                style: TextStyle(color: ColorsScreens.grey, fontSize: 14.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIcon(  ) {
    if (icon == null)
    { return FaIcon(icon2);}
    else {

  return  Icon(icon, size: 20.h, color: ColorsScreens.grey); }
    }
}
