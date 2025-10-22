import 'package:flutter/material.dart';
import 'package:untitled/Component/reactive_radio.dart';

import '../Component/card_question.dart';
import '../Component/list_question_com.dart';

class ContentListQuestion extends StatelessWidget {
  const ContentListQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView.builder(
        itemCount: listQuestion.length,
        itemBuilder: (context, index) =>
            CardQuestion(index: index, numberItem: listQuestion.length,
                radioFormExample: RadioFormExample(questionModel: listQuestion[index]) )
      ),
    );
  }
}
