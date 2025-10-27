import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Component/animation_icon.dart';
import 'package:untitled/Cubit/ui_cubit.dart';

import '../Component/list_question_com.dart';
import '../Cubit/ui_cubit.dart';
import 'content_list_question.dart';

class Questions extends StatelessWidget {
  const Questions({super.key});

  @override
  Widget build(BuildContext context) {
    const double gapY1 = 58;
    const double gapY2 = 103;
    const double gapY3 = 148;
    const double gapX1 = 58;
    const double gapX2 = 103;

    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: [
          BlocBuilder<UiCubit, UiState>(
            builder: (context, state) {
              final cubit = context.read<UiCubit>();
              final listAnswerUser = cubit.listAnswerUser;
              bool showCorrect = false;
              if (state is UiShowCorrectAnswers) {
                showCorrect = state.showCorrect;
              }

              return ContentListQuestion(
                key: ValueKey(listAnswerUser.length),
                showCorrectAnswers: showCorrect,
              );
            },
          ),

          BlocBuilder<UiCubit, UiState>(
            builder: (context, state) {
              if (state is TimerRunning && !state.isClosed) {
                final cubit = context.read<UiCubit>();
                return Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: cubit.startTimer,
                          icon: SvgPicture.asset('assets/Logo/play_icon.svg'),
                        ),
                        const Spacer(flex: 25),
                        Text(
                          cubit.formatTime(state.seconds),
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(flex: 3),
                        IconButton(
                          onPressed: cubit.resetTimer,
                          icon: const Icon(Icons.replay, size: 30),
                        ),
                        IconButton(
                          onPressed: cubit.closeTimer,
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),

          BlocBuilder<UiCubit, UiState>(
            builder: (context, state) {
              final cubit = context.read<UiCubit>();
              final isShow = cubit.isShow;
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
                      onPressed: () => context.read<UiCubit>().showTimer(),
                      image: 'assets/Logo/timer_icon.svg',
                      isShow: isShow,
                    ),
                    AnimationIcon(
                      right: isShow ? gapX1 : 0,
                      bottom: 0,
                      heroTag: 'seq',
                      onPressed: () {},
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
                        backgroundColor: Colors.white,
                        onPressed: cubit.toggleIcons,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          transitionBuilder: (child, anim) =>
                              RotationTransition(turns: anim, child: child),
                          child: Icon(
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
    );
  }
}
