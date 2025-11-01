import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Component/animation_icon.dart';
import 'package:untitled/Cubit/CubitTimer/timer_cubit.dart';
import 'package:untitled/Cubit/ui_cubit.dart';

import '../Component/container_icon.dart';
import '../Component/text_top.dart';
import '../models/question_model.dart';
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
        backgroundColor: Colors.teal,
        body: Stack(
          children: [

            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(children: [
                    ContainerIcon(onTap: () {},
                      valueRadius: 10.r,
                      icon: Icon(Icons.arrow_back_ios,
                        color: Colors.black,),
                      color: Colors.white,),
                    Spacer(flex: 1,),
                    TextTop(text: 'قائمة الأسئلة و الدورات',),

                  ],),


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
                                    'assets/Logo/play_icon.svg'),
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
                        );
                      }

                        else{
                          return SizedBox();
                        }

                      }
                  ),


                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: BlocBuilder<UiCubit, UiState>(
                builder: (context, state) {
                  final cubit = context.read<UiCubit>();
                  bool showCorrect = false;
                  if (state is UiShowCorrectAnswers) {
                    showCorrect = state.showCorrect;
                  }

                  return ContentListQuestion(
                    key: ValueKey(cubit.reset),
                    showCorrectAnswers: showCorrect,
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
                        onPressed: context
                            .read<TimerCubit>()
                            .showTimer,
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
                          backgroundColor: Colors.white,
                          onPressed: cubit.toggleIcons,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
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
      ),
    );
  }
}
