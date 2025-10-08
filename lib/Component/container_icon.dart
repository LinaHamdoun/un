import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Colors/colors_screens.dart';

class ContainerIcon extends StatelessWidget {
  final void Function()? onTap;
  final double? valueRadius;

  final Icon? icon;

  final Color color;

  const ContainerIcon({
    super.key,
    required this.onTap,
    required this.valueRadius,
    required this.icon,
    required this.color,
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
        child: icon,
      ),
    );
  }
}
