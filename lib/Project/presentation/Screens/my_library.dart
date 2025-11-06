import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Project/domain/models/question_model.dart';

import '../Colors/colors_screens.dart';
import '../Component/card_widget.dart';
import '../Component/container_icon.dart';
import '../Component/text_top.dart';
import 'home_screen.dart';

class MyLibrary extends StatelessWidget {
  const MyLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsScreens.black,
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 1),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Row(
                          children: [
                            ContainerIcon(
                              onTap: () {
                                context.pushPage(HomeScreen());
                              },
                              valueRadius: 12.r,
                              icon: Icon(Icons.keyboard_arrow_left, size: 25.h),
                              color: Colors.white,
                            ),
                            SizedBox(width: 10.w),
                          ],

                        ),
                      ),
                      TextTop(text: 'مكتبتي', size: 23.sp),
                    ],
                  ),
                  SizedBox(height: 40.h),

                  SizedBox(
                    height: 600.h,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CardWidget(
                            title: 'فيزياء',
                            subtitle: '10 دروس و 15 ملف',
                            onTap: () {},
                          ),
                          CardWidget(
                            title: 'فيزياء',
                            subtitle: '10 دروس و 15 ملف',
                            onTap: () {},
                          ),
                          CardWidget(
                            title: 'فيزياء',
                            subtitle: '10 دروس و 15 ملف',
                            onTap: () {},
                          ),
                          CardWidget(
                            title: 'فيزياء',
                            subtitle: '10 دروس و 15 ملف',
                            onTap: () {},
                          ),
                          CardWidget(
                            title: 'فيزياء',
                            subtitle: '10 دروس و 15 ملف',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),

                  Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
