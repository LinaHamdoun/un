import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Colors/colors_screens.dart';
import 'package:untitled/Screens/content_personal.dart';

import '../Component/bottom_appBar.dart';
import '../Component/floating_action_button.dart';
import 'content_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [ContentHome(), ContentPersonal()];

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 50.0.h),
        child: CustomFloatingActionButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: ColorsScreens.black,
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: BottomApp(
        screenW: screenW,
        current: currentIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
