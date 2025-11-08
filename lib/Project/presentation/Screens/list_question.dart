import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Project/domain/models/question_model.dart';
import 'package:untitled/Project/presentation/Colors/colors_screens.dart';
import 'package:untitled/Project/presentation/Screens/test_screen.dart';

import '../Component/animation_icon.dart';
import '../Component/container_icon.dart';
import '../Component/text_top.dart';
import '../Cubit/CubitTimer/timer_cubit.dart';
import '../Cubit/ui_cubit.dart';
import 'content_list_question.dart';

class Questions extends StatelessWidget {
  const Questions({super.key});

  @override
  Widget build(BuildContext context) {
    double gapY1 = 58.h;
    double gapY2 = 103.h;
    double gapY3 = 148.h;
    double gapX1 = 58.w;
    double gapX2 = 103.w;

    return BlocProvider(
      create: (context) => TimerCubit(),
      child: Scaffold(
        backgroundColor: ColorsScreens.black,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        ContainerIcon(
                          onTap: () => context.pushPage(TestScreen()),
                          valueRadius: 10.r,
                          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                          color: Colors.white,
                        ),
                        Spacer(flex: 1),
                        TextTop(text: 'قائمة الأسئلة و الدورات'),
                      ],
                    ),
          
                    BlocBuilder<TimerCubit, TimerState>(
                      builder: (context, state) {
                        if (state is TimerRunning && !state.isClosed) {
                          final cubit = context.read<TimerCubit>();
          
                          return Align(
                            alignment: Alignment.topCenter,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: cubit.startTimer,
                                  icon: SvgPicture.asset(
                                    'assets/Logo/play_icon.svg',
                                  ),
                                ),
                                const Spacer(flex: 25),
                                Text(
                                  cubit.formatTime(state.seconds),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(flex: 3),
                                IconButton(
                                  onPressed: cubit.resetTimer,
                                  icon: const Icon(Icons.replay, size: 30, color: Colors.white,),
                                ),
                                IconButton(
                                  onPressed: cubit.closeTimer,
                                  icon: const Icon(Icons.close, color: Colors.white,),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: BlocBuilder<UiCubit, UiState>(
                  builder: (context, state) {
                    bool correctAnswerUser = false;
                    if (state is UiCorrectAnswerUser) {
                      correctAnswerUser = state.correctAnswerUser;
                    }
                    bool showCorrect = false;
                    if (state is UiShowCorrectAnswers) {
                      showCorrect = state.showCorrect;
                    }
                    bool reset = false;
                    if (state is UiAnswersReset) {
                      reset = state.reset;
                    }
          
                    return ContentListQuestion(
                      showCorrectAnswers: showCorrect,
                      correctAnswerUser: correctAnswerUser,
                      reset: reset,
                    );
                  },
                ),
              ),
          
              BlocBuilder<UiCubit, UiState>(
                builder: (context, state) {
                  final cubit = context.read<UiCubit>();
                  bool isShow = cubit.isShow;
                  return Positioned(
                    right: 20,
                    bottom: 20,
                    width: 300,
                    height: 300,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        AnimationIcon(
                          right: 0,
                          bottom: isShow ? gapY1 : 0,
                          heroTag: 'check',
                          onPressed: cubit.toggleShowCorrect,
                          image: 'assets/Logo/checke_icon.svg',
                          isShow: isShow,
                        ),
                        AnimationIcon(
                          right: 0,
                          bottom: isShow ? gapY2 : 0,
                          heroTag: 'delete',
                          onPressed: cubit.resetAll,
                          image: 'assets/Logo/delete_icon.svg',
                          isShow: isShow,
                        ),
                        AnimationIcon(
                          right: 0,
                          bottom: isShow ? gapY3 : 0,
                          heroTag: 'timer',
                          onPressed: context.read<TimerCubit>().showTimer,
                          image: 'assets/Logo/timer_icon.svg',
                          isShow: isShow,
                        ),
                        AnimationIcon(
                          right: isShow ? gapX1 : 0,
                          bottom: 0,
                          heroTag: 'seq',
                          onPressed: cubit.funCorrectAnswerUser,
                          image: 'assets/Logo/sequer_checkeIcon.svg',
                          isShow: isShow,
                        ),
                        AnimationIcon(
                          right: isShow ? gapX2 : 0,
                          bottom: 0,
                          heroTag: 'sent',
                          onPressed: () => debugPrint('sent pressed'),
                          image: 'assets/Logo/sent_icon.svg',
                          isShow: isShow,
                        ),
          
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: FloatingActionButton(
                            elevation: 0,
                            shape: const CircleBorder(),
                            heroTag: 'main',
                            backgroundColor: ColorsScreens.amber,
                            onPressed: cubit.toggleIcons,
                            child: AnimatedSwitcher(
                              duration: const Duration(seconds: 1),
                              transitionBuilder: (child, anim) =>
                                  RotationTransition(turns: anim, child: child),
                              child: Icon(
                                color: Colors.white,
                                isShow ? Icons.close : Icons.dehaze_rounded,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
