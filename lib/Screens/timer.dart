import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Colors/colors_screens.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});





  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
   int seconds = 0;
   Timer? timer;
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
    return
      Scaffold(
        floatingActionButton: FloatingActionButton(onPressed:showTimer, child: Icon(Icons.check),),
        body: Align(
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

                      IconButton(onPressed: closeTimer, icon: Icon(Icons.close)),
                    ],
                  ),
                ),
        ),
      );



  }
}
