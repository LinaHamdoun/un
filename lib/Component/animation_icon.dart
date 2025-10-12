



import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnimationIcon extends StatefulWidget {
  const AnimationIcon({super.key, required this.right, required this.bottom, required this.heroTag,
    required this.onPressed,  required this.image, required this.isShow,});

 final  double right ;
 final double bottom ;
 final String heroTag ;
 final VoidCallback onPressed ;
 final String image ;
 final bool isShow;


  @override
  State<AnimationIcon> createState() => _AnimationIconState();
}

class _AnimationIconState extends State<AnimationIcon> {

  @override
  Widget build(BuildContext context) {
    const animationDuration = Duration(milliseconds: 400);
    const animationCurve = Curves.easeInOutCubic;

    return                 AnimatedPositioned(


      duration: animationDuration,
      curve: animationCurve,
      right: widget.right,
      // right
      bottom: widget.bottom ,
      //bottom

      child: AnimatedOpacity(
        opacity: widget. isShow ? 1 : 0,
        duration: animationDuration,
        curve: animationCurve,
        child: FloatingActionButton(
          elevation: 0,
          shape:  CircleBorder(),
          heroTag: widget.heroTag,
          //herotag
          mini: true,
          backgroundColor: Colors.white,
          onPressed: widget.onPressed,
          // onPressed
          child:
          SvgPicture.asset(widget .image, height: 24),
          // image name
        ),
      ),
    );

  }
}
