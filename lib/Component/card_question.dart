import 'package:flutter/material.dart';
import 'package:untitled/Component/reactive_radio.dart';
import 'package:untitled/Component/star.dart';

class CardQuestion extends StatelessWidget {
  final int numberItem;
  final int index;
  final RadioFormExample radioFormExample;
  final bool click;
  final VoidCallback onStarToggle;

  const CardQuestion({
    super.key,
    required this.index,
    required this.numberItem,
    required this.radioFormExample,
    required this.click,
    required this.onStarToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Star(clickStar: click, onToggle: onStarToggle),
              const Spacer(),
              radioFormExample,
            ],
          ),
          Text('السؤال رقم ${index + 1} من $numberItem'),
        ],
      ),
    );
  }
}
