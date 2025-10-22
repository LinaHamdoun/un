


import 'package:flutter/material.dart';

class Star extends StatefulWidget {
  const Star({super.key});

  @override
  State<Star> createState() => _StarState();
}

class _StarState extends State<Star> {
  bool clickStar = false ;
  @override
  Widget build(BuildContext context) {
    return                 clickStar
        ? IconButton(
      onPressed: () {
        setState(() {
          clickStar = false;
        });
      },
      icon: Icon(
        Icons.star_outlined,
        color: Colors.amber,
        size: 35,
      ),
    )
        : IconButton(
      onPressed: () {
        setState(() {
          clickStar = true;
        });
      },
      icon: Icon(
        Icons.star_border,
        color: Colors.amber,
        size: 35,
      ),
    );




  }
}
