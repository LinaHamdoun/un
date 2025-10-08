





import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Colors/colors_screens.dart';

class TextTop extends StatelessWidget
{

  final String text ;
  final   double?  size ;

    const TextTop({super.key, required this.text, this.size});


  @override
  Widget build(BuildContext context) {
    return Text( text  ,
      textAlign:TextAlign.end ,
      style:   TextStyle(fontWeight: FontWeight.bold,
          fontSize: size??  25.sp,

       // overflow:TextOverflow.ellipsis ,
        color: ColorsScreens.amber),
    );
  }

}
