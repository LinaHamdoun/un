
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      },
      child: TestScreen()
    );
  }
}
