import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Project/domain/models/question_model.dart';
import 'package:untitled/Project/presentation/Screens/summaries_screen.dart';

import '../Colors/colors_screens.dart';
import '../Component/card_test.dart';
import '../Component/container_icon.dart';
import '../Component/text_top.dart';
import 'list_question.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsScreens.black,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                onTap: () => context.pushPage(SummariesScreen()),

                                valueRadius: 12.r,
                                icon: Icon(Icons.keyboard_arrow_left, size: 25.h),
                                color: Colors.white,
                              ),
                              SizedBox(width: 10.w),
                            ],
                          ),
                        ),
                        TextTop(text: 'قائمة الأسئلة و الدورات', size: 23.sp),
                      ],
                    ),
                    SizedBox(height: 40.h),
        
                    SizedBox(
                      height: 600.h,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CardTest(
                              txt1: 'دورة 2025',
                              txt2: '20 سؤال',
                              txt3: 'بدء الحل',
                              onTap: () => context.pushPage(Questions()),

                            ),
                            CardTest(
                              txt1: 'دورة 2025',
                              txt2: '20 سؤال',
                              txt3: 'بدء الحل',
                              onTap: () => context.pushPage(Questions()),
                            ),
                            CardTest(
                              txt1: 'دورة 2025',
                              txt2: '20 سؤال',
                              txt3: 'بدء الحل',
                              onTap: () => context.pushPage(Questions()),
                            ),
                            CardTest(
                              txt1: 'دورة 2025',
                              txt2: '20 سؤال',
                              txt3: 'بدء الحل',
                              onTap: () => context.pushPage(Questions()),
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
      ),
    );
  }
}
