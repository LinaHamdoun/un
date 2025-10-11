import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  @override
  Widget build(BuildContext context) {
    const double gapY1 = 60;
    const double gapY2 = 115;
    const double gapY3 = 170;
    const double gapX1 = 70;
    const double gapX2 = 135;

    const animationDuration = Duration(milliseconds: 400);
    const animationCurve = Curves.easeInOutCubic;

    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: [
          Positioned(
            right: 20,
            bottom: 20,
            width: 300,
            height: 300,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                AnimatedPositioned(
                  duration: animationDuration,
                  curve: animationCurve,
                  right: 0,
                  bottom: isShow ? gapY1 : 0,
                  child: AnimatedOpacity(
                    opacity: isShow ? 1 : 0,
                    duration: animationDuration,
                    curve: animationCurve,
                    child: FloatingActionButton(
                      heroTag: 'check',
                      mini: true,
                      backgroundColor: Colors.white,
                      onPressed: () => debugPrint('✅ check pressed'),
                      child:
                      SvgPicture.asset('assets/Logo/checke_icon.svg', height: 24),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: animationDuration,
                  curve: animationCurve,
                  right: 0,
                  bottom: isShow ? gapY2 : 0,
                  child: AnimatedOpacity(
                    opacity: isShow ? 1 : 0,
                    duration: animationDuration,
                    curve: animationCurve,
                    child: FloatingActionButton(
                      heroTag: 'delete',
                      mini: true,
                      backgroundColor: Colors.white,
                      onPressed: () => debugPrint('🗑 delete pressed'),
                      child:
                      SvgPicture.asset('assets/Logo/delete_icon.svg', height: 24),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: animationDuration,
                  curve: animationCurve,
                  right: 0,
                  bottom: isShow ? gapY3 : 0,
                  child: AnimatedOpacity(
                    opacity: isShow ? 1 : 0,
                    duration: animationDuration,
                    curve: animationCurve,
                    child: FloatingActionButton(
                      heroTag: 'timer',
                      mini: true,
                      backgroundColor: Colors.white,
                      onPressed: () => debugPrint('⏱ timer pressed'),
                      child:
                      SvgPicture.asset('assets/Logo/timer_icon.svg', height: 24),
                    ),
                  ),
                ),

                AnimatedPositioned(
                  duration: animationDuration,
                  curve: animationCurve,
                  right: isShow ? gapX1 : 0,
                  bottom: 0,
                  child: AnimatedOpacity(
                    opacity: isShow ? 1 : 0,
                    duration: animationDuration,
                    curve: animationCurve,
                    child: FloatingActionButton(
                      heroTag: 'seq',
                      mini: true,
                      backgroundColor: Colors.white,
                      onPressed: () => debugPrint('🔁 sequence pressed'),
                      child: SvgPicture.asset(
                          'assets/Logo/sequer_checkeIcon.svg',
                          height: 24),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: animationDuration,
                  curve: animationCurve,
                  right: isShow ? gapX2 : 0,
                  bottom: 0,
                  child: AnimatedOpacity(
                    opacity: isShow ? 1 : 0,
                    duration: animationDuration,
                    curve: animationCurve,
                    child: FloatingActionButton(
                      heroTag: 'sent',
                      mini: true,
                      backgroundColor: Colors.white,
                      onPressed: () => debugPrint('📤 sent pressed'),
                      child:
                      SvgPicture.asset('assets/Logo/sent_icon.svg', height: 24),
                    ),
                  ),
                ),

                Positioned(
                  right: 0,
                  bottom: 0,
                  child: FloatingActionButton(
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
