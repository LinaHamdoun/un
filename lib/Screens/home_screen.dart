import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Colors/colors_screens.dart';
import 'package:untitled/Cubit/ui_cubit.dart';
import 'package:untitled/Screens/content_personal.dart';

import '../Component/bottom_appBar.dart';
import '../Component/floating_action_button.dart';
import 'content_home.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

 final  List<Widget> screens = [ContentHome(), ContentPersonal()];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UiCubit>();
    int currentIndex  = cubit.currentIndex;



    return BlocBuilder<UiCubit, UiState>(
  builder: (context, state) {
    if (state is OnItemTapped)
      {
        currentIndex= state.currentIndex;
      }
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 50.0.h),
        child: CustomFloatingActionButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: ColorsScreens.black,
      body: IndexedStack(index:currentIndex , children: screens),
      bottomNavigationBar: BottomApp(
        screenW: double.infinity,
        current: currentIndex,
        onTap: cubit.onItemTapped,
      ),
    );
  },
);
  }
}
