import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Screens/physics_screen.dart';

import '../Component/card_widget.dart';
import '../Component/container_icon.dart';
import '../Component/text_top.dart';

class ContentHome extends StatelessWidget {
  const ContentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
                  child: ContainerIcon(
                    onTap: () {},
                    valueRadius: 12.r,
                    icon: Icon(Icons.file_download_outlined),
                    color: Colors.white,
                  ),
                ),
                TextTop(
                  text:
                      'أهلاً بك ، [اسم الطالب]\nاختر مادتك و ابدأ التعلم الآن',
                  size: 23.sp,
                ),
              ],
            ),
            SizedBox(height: 40.h),

            SizedBox(
              height: 550.h,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  CardWidget(
                    title: 'فيزياء',
                    subtitle: '10 أبحاث',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhysicsScreen(),
                        ),
                      );
                    },
                  ),
                  CardWidget(
                    title: 'رياضيات',
                    subtitle: '10 أبحاث',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhysicsScreen(),
                        ),
                      );
                    },
                  ),
                  CardWidget(
                    title: 'كيمياء',
                    subtitle: '10 أبحاث',
                    onTap: () {},
                  ),
                  CardWidget(title: 'علوم', subtitle: '10 أبحاث', onTap: () {}),
                  CardWidget(title: 'عربي', subtitle: '10 أبحاث', onTap: () {}),
                ],
              ),
            ),

            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
