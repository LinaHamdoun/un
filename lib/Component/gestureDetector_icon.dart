import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Pages/home_screen.dart';
import 'package:untitled/Pages/my_library.dart';

import '../Pages/my_own.dart';

class GestureDetectorIcon extends StatelessWidget {
  final String text;

  final String selected;

  final VoidCallback onTap;

  const GestureDetectorIcon({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = (text == selected);


    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            text == 'الرئيسية' ? Icons.home_outlined : Icons.person,
            color: isSelected ? const Color(0xFFD4AF37) : Colors.grey,
          ),
          SizedBox(height: 4.h),
          Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              color: isSelected ? const Color(0xFFD4AF37) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

 class IconSelectorExample extends StatefulWidget{
  const IconSelectorExample({super.key});

  @override
  State<IconSelectorExample> createState() => _IconSelectorExampleState();
}

class _IconSelectorExampleState extends State<IconSelectorExample> {
  String  selected =  'الرئيسية';
  @override
  Widget build(BuildContext context) {
    return Row (
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetectorIcon(text: 'الرئيسية', selected: selected, onTap: () => setState(() => selected = 'الرئيسية')),

        GestureDetectorIcon(text: 'شخصي', selected: selected , onTap: () =>setState(() => selected = 'شخصي')
        ),



      ],
    );


  }
}
