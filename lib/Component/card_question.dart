import 'package:flutter/material.dart';
import 'package:untitled/Component/reactive_radio.dart';
import 'package:untitled/Component/star.dart';

import '../models/question_model.dart';
import 'list_question_com.dart';

class CardQuestion extends StatelessWidget {
  final int numberItem;

  final int index;

  final RadioFormExample radioFormExample;

  const CardQuestion({
    super.key,
    required this.index,
    required this.numberItem,
    required this.radioFormExample,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,

            children: [Star(),Spacer(flex: 1,), radioFormExample],
          ),

          Text('$index'),
          Text('$numberItem'),
        ],
      ),
    );
  }
}
