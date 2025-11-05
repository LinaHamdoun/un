import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClickColumn extends StatelessWidget {
  const ClickColumn({
    super.key,
    required this.nameScreen,
    required this.onTap,
    required this.icon,
    required this.isSelected,
  });

  final String nameScreen;
  final IconData icon;
  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
      onTap: onTap,
    
      child: Column(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.yellow : Colors.grey,
            size: 30.h,
          ),
          SizedBox(height: 3.h),
          Text(
            nameScreen,
            style: TextStyle(color: isSelected ? Colors.yellow : Colors.grey),
          ),
        ],
      ),
    );
  }
}
