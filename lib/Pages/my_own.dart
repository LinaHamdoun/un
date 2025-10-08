import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/Colors/colors_screens.dart';
import 'package:untitled/Pages/my_library.dart';
import 'package:untitled/Pages/scanner_screen.dart';

import '../Component/bottom_appBar.dart';
import '../Component/container_myown.dart';
import '../Component/gestureDetector_icon.dart';
import '../Component/text_top.dart';

class MyOwn extends StatelessWidget {
  const MyOwn({super.key});

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorsScreens.black,
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:10 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 2,),

                  TextTop(text: '[اسم الطالب الكامل]'),
                  SizedBox(height: 10),
                  TextTop(text: '[ايميل الطالب]', size: 17),
                  SizedBox(height: 60),

                  ContainerMyOwn(
                    children: [
                      ContainerMyOwn.buildPadding(''),
                      TextAndIcon(
                        txt: 'المعلومات الشخصية',
                        icon: Icons.person_rounded,
                        onTap: () {},
                      ),
                      TextAndIcon(
                        txt: 'مكتبتي',
                        icon: Icons.library_books_rounded,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyLibrary()));
                        },
                      ),
                      TextAndIcon(
                        txt: 'تسجيل خروج',
                        icon: Icons.logout,
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 25,),

                  ContainerMyOwn(
                    children: [
                      ContainerMyOwn.buildPadding(''),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Spacer(flex: 3,),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,

                            children: [
                              TextAndIcon(
                                txt: 'تيلغرام',
                                icon: FontAwesomeIcons.telegram,
                                onTap: () {},
                              ),
                              TextAndIcon(
                                txt: 'فيسبوك',
                                icon: FontAwesomeIcons.facebook,
                                onTap: () {},
                              ),
                            ],
                          ),
                          Spacer(flex: 2,),



                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextAndIcon(
                                txt: 'انستغرام',
                                icon: FontAwesomeIcons.instagram,
                                onTap: () {},
                              ),
                              TextAndIcon(
                                txt: 'واتساب',
                                icon: FontAwesomeIcons.whatsapp,
                                onTap: () {},
                              ),
                            ],
                          ),

                        ],
                      ),
                    ],
                  ),

                  Spacer(flex: 5,),
                ],
              ),
            ),
          ),

          BottomApp(screenW: screenW),
        ],
      ),
    );
  }
}
