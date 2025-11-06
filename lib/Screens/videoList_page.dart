import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/Colors/colors_screens.dart';
import 'package:untitled/Screens/physics_nawasat.dart';
import 'package:untitled/models/question_model.dart';

import '../Component/card_widget.dart';
import '../Component/container_icon.dart';
import '../Component/text_top.dart';

class VideoListPage extends StatelessWidget {
  const VideoListPage({super.key});

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
                              onTap: () => context.pushPage(PhysicsNawasat()),
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
                      TextTop(text: 'قائمة الفيديوهات', size: 23.sp),
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
                            title: 'عنوان الفيديو',
                            subtitle: '20 دقيقة',
                            image: 'assets/Logo/p.jpg',
                            imageIcon: 'assets/Logo/playicon.svg',



                            onTap: () {},
                          ),
                          CardWidget(
                            title: 'عنوان الفيديو',
                            subtitle: '20 دقيقة',
                            image: 'assets/Logo/p.jpg',
                            imageIcon: 'assets/Logo/playicon.svg',


                            onTap: () {},
                          ),
                          CardWidget(
                            title: 'عنوان الفيديو',
                            subtitle: '20 دقيقة',
                            image: 'assets/Logo/p.jpg',
                            imageIcon: 'assets/Logo/playicon.svg',



                            onTap: () {},
                          ),
                          CardWidget(
                            title: 'عنوان الفيديو',
                            subtitle: '20 دقيقة',
                            image: 'assets/Logo/p.jpg',
                            imageIcon: 'assets/Logo/lock.svg',

                            onTap: () {},
                          ),
                          CardWidget(
                            title: 'عنوان الفيديو',
                            subtitle: '20 دقيقة',
                            image: 'assets/Logo/p.jpg',
                            imageIcon: 'assets/Logo/lock.svg',


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
