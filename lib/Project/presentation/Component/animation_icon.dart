import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnimationIcon extends StatelessWidget {
  const AnimationIcon({
    super.key,
    required this.right,
    required this.bottom,
    required this.heroTag,
    required this.onPressed,
    required this.image,
    required this.isShow,
  });

  final double right;

  final double bottom;

  final String heroTag;

  final VoidCallback onPressed;

  final String image;

  final bool isShow;

  @override
  Widget build(BuildContext context) {
    const animationDuration = Duration(milliseconds: 400);
    const animationCurve = Curves.easeInOutCubic;

    return AnimatedPositioned(
      duration: animationDuration,
      curve: animationCurve,
      right: right,
      // right
      bottom: bottom,

      //bottom
      child: AnimatedOpacity(
        opacity: isShow ? 1 : 0,
        duration: animationDuration,
        curve: animationCurve,
        child: FloatingActionButton(
          elevation: 0,
          shape: CircleBorder(),
          heroTag: heroTag,
          mini: true,
          backgroundColor: Colors.white,
          onPressed: onPressed,
          // onPressed
          child: SvgPicture.asset(image, height: 24),
          // image name
        ),
      ),
    );
  }
}
