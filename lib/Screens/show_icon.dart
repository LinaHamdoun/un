import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Colors/colors_screens.dart';

class ShowIcon extends StatefulWidget {
  const ShowIcon({super.key});

  @override
  State<ShowIcon> createState() => _ShowIconState();
}

class _ShowIconState extends State<ShowIcon>
    with SingleTickerProviderStateMixin {
  bool isShow = false;
  bool click = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleIcons() {
    if (isShow) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      isShow = !isShow;
    });
  }

  Widget _buildAnimatedIcon(
    String image,
    double offsetX,
    double offsetY,
    VoidCallback onTap,
  ) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final progress = Curves.easeOut.transform(_controller.value);
        return Transform.translate(
          offset: Offset(offsetX * progress, -offsetY * progress),
          child: Opacity(
            opacity: progress,
            child: Visibility(
              visible: progress > 0.1,
              child: FloatingActionButton(
                heroTag: image,
                mini: true,
                elevation: 2,
                backgroundColor: Colors.white,
                shape: const CircleBorder(),
                onPressed: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(image, height: 30),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              children: [
                if (click) const Text('nggnm mmbg'),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, right: 20),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    clipBehavior: Clip.none,
                    children: [
                      _buildAnimatedIcon(
                        'assets/Logo/sent_icon.svg',
                        -110,
                        5,
                        () {
                          debugPrint('sent icon pressed');
                        },
                      ),
                      _buildAnimatedIcon(
                        'assets/Logo/sequer_checkeIcon.svg',
                        -60,
                        5,
                        () {
                          debugPrint('sequer pressed');
                        },
                      ),
                      _buildAnimatedIcon(
                        'assets/Logo/timer_icon.svg',
                        0,
                        60,
                        () {
                          debugPrint('timer pressed');
                        },
                      ),
                      _buildAnimatedIcon(
                        'assets/Logo/delete_icon.svg',
                        0,
                        105,
                        () {
                          debugPrint('delete pressed');
                        },
                      ),
                      _buildAnimatedIcon(
                        'assets/Logo/checke_icon.svg', 0, 150, () {},
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.white,
                        foregroundColor: ColorsScreens.amber,
                        elevation: 3,
                        onPressed: toggleIcons,
                        shape: const CircleBorder(),
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
                    ],
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
