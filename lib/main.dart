import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Project/presentation/Cubit/ui_cubit.dart';
import 'Project/presentation/Screens/login_screen.dart';

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
          return BlocProvider(
            create: (context) => UiCubit(),
            child: MaterialApp(
              theme: ThemeData(
                  fontFamily: 'Tajawal', brightness: Brightness.light),
              debugShowCheckedModeBanner: false,
              home: child,
            ),
          );
        },
        child: LogIn()
    );
  }
}
