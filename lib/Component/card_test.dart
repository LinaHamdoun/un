import 'package:flutter/material.dart';
import 'package:untitled/Colors/colors_screens.dart';

class CardTest extends StatelessWidget {
  const CardTest({
    super.key,
    required this.txt1,
    required this.txt2,
    required this.txt3,
    required this.onTap,
  });

  final String txt1;

  final String txt2;
  final String txt3;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff262C37),
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(txt1, style: TextStyle(color: Color(0xff947E45))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(txt2, style: TextStyle(color: Colors.grey)),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff47443B),
              ),

              alignment: Alignment.center,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 4),

              child: Text(
                txt3,
                style: TextStyle(
                  color: Color(0xffA28947),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
