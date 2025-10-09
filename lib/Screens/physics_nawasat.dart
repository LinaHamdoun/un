import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Colors/colors_screens.dart';
import 'package:untitled/Screens/physics_screen.dart';
import 'package:untitled/Screens/summaries_screen.dart';
import 'package:untitled/Screens/videoList_page.dart';

import '../Component/card_widget.dart';
import '../Component/container_icon.dart';
import '../Component/text_top.dart';

class PhysicsNawasat extends StatelessWidget {
  const PhysicsNawasat({super.key});

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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PhysicsScreen(),
                                  ),
                                );
                              },
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
                      TextTop(text: 'فيزياء,نواسات', size: 23.sp),
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
                            title: 'الفيديوهات',
                            subtitle: '20 فيديو',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoListPage(),
                                ),
                              );
                            },
                          ),
                          CardWidget(
                            title: 'الملخصات النوط',
                            subtitle: '20 ملخص',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SummariesScreen(),
                                ),
                              );
                            },
                          ),
                          CardWidget(
                            title: 'الأسئلة و الاختبارات',
                            subtitle: '20 دزوس',
                            onTap: () {},
                          ),
                          CardWidget(
                            title: 'المفضلة',
                            subtitle: '20 سؤال',
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
