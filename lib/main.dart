
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Component/reactive_radio.dart';

import 'Component/card_question.dart';
import 'Screens/content_list_question.dart';
import 'Screens/test_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return SafeArea(
          child: MaterialApp(
            theme: ThemeData(fontFamily: 'Tajawal'),
            debugShowCheckedModeBanner: false,
            home: child,
          ),

        );
      }, child:ContentListQuestion()
    );
  }
}
