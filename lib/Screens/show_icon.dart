import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Component/animation_icon.dart';

class ShowIcons extends StatefulWidget {
  const ShowIcons({super.key});

  @override
  State<ShowIcons> createState() => _ShowIconsState();
}

class _ShowIconsState extends State<ShowIcons> {
  bool isShow = false;

  void toggleIcons() {
    setState(() {
      isShow = !isShow;
    });
  }

  Timer? timer;

  int seconds = 0;
  bool isClosed = false;

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        seconds++;
      });
    });
  }

  void resetTimer() {
    startTimer();
    setState(() {
      seconds = 0;
    });
  }

  void closeTimer() {
    resetTimer();
    setState(() {
      isClosed = true;
    });
  }

  void showTimer() {
    timer?.cancel();
    setState(() {
      seconds = 0;
      isClosed = false;
    });
  }

  @override
  void initState() {
    super.initState();
    isClosed = true;
    seconds = 0;
  }

  String formatTime(int totalSeconds) {
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int secs = totalSeconds % 60;

    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(hours)} : ${twoDigits(minutes)} : ${twoDigits(secs)}";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

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
          Align(
            alignment: Alignment.topCenter,
            child: isClosed
                ? SizedBox()
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: startTimer,
                          icon: SvgPicture.asset('assets/Logo/play_icon.svg'),
                        ),
                        Spacer(flex: 25),

                        Text(
                          formatTime(seconds),
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(flex: 3),

                        IconButton(
                          onPressed: resetTimer,
                          icon: Icon(Icons.replay, size: 30),
                        ),

                        IconButton(
                          onPressed: closeTimer,
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
          ),

          Positioned(
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
                  onPressed: () => debugPrint(' check pressed'),
                  image: 'assets/Logo/checke_icon.svg',
                  isShow: isShow,
                ),

                AnimationIcon(
                  right: 0,
                  bottom: isShow ? gapY2 : 0,
                  heroTag: 'delete',
                  onPressed: () => debugPrint('delete pressed'),
                  image: 'assets/Logo/delete_icon.svg',
                  isShow: isShow,
                ),

                AnimationIcon(
                  right: 0,
                  bottom: isShow ? gapY3 : 0,
                  heroTag: 'timer',
                  onPressed: showTimer,
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
                  onPressed: () => debugPrint(' sent pressed'),
                  image: 'assets/Logo/sent_icon.svg',
                  isShow: isShow,
                ),

                Positioned(
                  right: 0,
                  bottom: 0,
                  child: FloatingActionButton(
                    elevation: 0,
                    shape: CircleBorder(),
                    heroTag: 'main',
                    backgroundColor: Colors.white,
                    onPressed: toggleIcons,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder: (child, anim) =>
                          RotationTransition(turns: anim, child: child),
                      child: Icon(
                        isShow ? Icons.close : Icons.dehaze_rounded,
                        key: ValueKey(isShow),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
