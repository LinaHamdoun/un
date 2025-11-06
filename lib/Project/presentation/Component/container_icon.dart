import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ContainerIcon extends StatelessWidget {
  final void Function()? onTap;
  final double? valueRadius;

  final Icon? icon;
  final Color color;
  final String ? image ;

  const ContainerIcon({
    super.key,
    required this.onTap,
    required this.valueRadius,
    required this.icon,
    required this.color,  this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(valueRadius!),
        ),
        padding: EdgeInsets.all(7.h),
        child: icon ,
      ),
    );
  }
}
