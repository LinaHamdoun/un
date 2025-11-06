import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Colors/colors_screens.dart';
import '../Component/bottom_appBar.dart';
import '../Component/floating_action_button.dart';
import '../Cubit/ui_cubit.dart';
import 'content_home.dart';
import 'content_personal.dart';

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
      body: SafeArea(child: IndexedStack(index:currentIndex , children: screens)),
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
