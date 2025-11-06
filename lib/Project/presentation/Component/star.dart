import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  final bool clickStar;
  final VoidCallback onToggle;

  const Star({super.key, required this.clickStar, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onToggle,
      icon: Icon(
        clickStar ? Icons.star : Icons.star_border,
        color: Colors.amber,
        size: 35,
      ),
    );
  }
}
