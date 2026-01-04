import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Project/domain/models/question_model.dart';
import 'package:untitled/Project/presentation/Screens/physics_nawasat.dart';

import '../Colors/colors_screens.dart';
import '../Component/card_widget.dart';
import '../Component/container_icon.dart';
import '../Component/text_top.dart';

class SummariesScreen extends StatelessWidget {
  const SummariesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsScreens.black,
      body: SafeArea(
        child: Stack(
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
                                onTap: () =>  Navigator.pop(context),
        
                                valueRadius: 12.r,
                                icon: Icon(Icons.keyboard_arrow_left, size: 25.h),
                                color: Colors.white,
                              ),
                              SizedBox(width: 10.w),
        
                              ContainerIcon(
                                onTap: () {},
                                valueRadius: 12.r,
                                icon: Icon(
                                  Icons.file_download_outlined,
                                  size: 25.h,
                                ),
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        TextTop(text: '', size: 23.sp),
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
                              title: 'ملخص قوانين الحركة',
                              subtitle: '20 صفحة',
                              image: 'assets/Logo/p.jpg',
                              imageIcon: 'assets/Logo/delete_.svg',
        
        
                              onTap: () {},
                            ),
                            CardWidget(
                              title: 'ملخص قوانين الحركة',
                              subtitle: '20 صفحة',
                              image: 'assets/Logo/p.jpg',
                              imageIcon: 'assets/Logo/download_.svg',
        
        
                              onTap: () {},
                            ),
                            CardWidget(
                              title: 'ملخص قوانين الحركة',
                              subtitle: '20 صفحة',
                              image: 'assets/Logo/p.jpg',
                              imageIcon: 'assets/Logo/download_.svg',



                              onTap: () {},
                            ),
                            CardWidget(
                              title: 'ملخص قوانين الحركة',
                              subtitle: '20 صفحة',
                              image: 'assets/Logo/p.jpg',
                              imageIcon: 'assets/Logo/download_.svg',


                              onTap: () {},
                            ),
        
                            CardWidget(
                              title: 'ملخص قوانين الحركة',
                              subtitle: '20 صفحة',
                              image: 'assets/Logo/p.jpg',
                              imageIcon: 'assets/Logo/download_.svg',


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
      ),
    );
  }
}
