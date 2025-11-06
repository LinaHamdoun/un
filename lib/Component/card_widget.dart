import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Colors/colors_screens.dart';

import '../Component/container_icon.dart';

class CardWidget extends StatelessWidget {
  final String? image;

  final String title;

  final String subtitle;

  final void Function()? onTap;
  final  String ? imageIcon ;

  const CardWidget({
    super.key,
    this.image,
    required this.title,
    required this.subtitle,
    required this.onTap,  this.imageIcon,
  });

  Widget _build(String? image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: image != null
          ? Image.asset(image, height: 85.h, width: 95.w, fit: BoxFit.cover)
          : SizedBox(width: 1.w),
    );
  }

  Widget buildIcon (String ? imageIcon)
  {
    if(imageIcon == null)
      {
        return SizedBox();
      }
    else {
      return SvgPicture.asset(imageIcon );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 75.h,
          decoration: BoxDecoration(
            color: ColorsScreens.black,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12.r),
            shape: BoxShape.rectangle,
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: buildIcon(imageIcon)
              ),
              Spacer(flex: 1),

              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: ColorsScreens.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          color: ColorsScreens.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _build(image),

              //  containerIcon ?? SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
