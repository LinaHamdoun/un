import 'package:flutter/material.dart';

class Star extends StatefulWidget {
  final bool clickStar;
  final VoidCallback? onTap;

  const Star({
    super.key,
    required this.clickStar,
    this.onTap,
  });

  @override
  State<Star> createState() => _StarState();
}

class _StarState extends State<Star> {
  late bool isClicked;

  @override
  void initState() {
    super.initState();
    isClicked = widget.clickStar;
  }

  void toggleStar() {
    setState(() {
      isClicked = !isClicked;
    });

    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: toggleStar,
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, anim) =>
            ScaleTransition(scale: anim, child: child),
        child: Icon(
          key: ValueKey(isClicked),
          isClicked ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 30,
        ),
      ),
    );
  }
}
