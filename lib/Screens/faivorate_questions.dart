import 'package:flutter/material.dart';
import 'package:untitled/Component/card_question.dart';
import 'package:untitled/Component/reactive_radio.dart';
import 'package:untitled/models/question_model.dart';

class FavoriteQuestions extends StatelessWidget {
  const FavoriteQuestions({super.key, required this.favoriteQuestions});

  final List<QuestionModel> favoriteQuestions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الأسئلة المفضلة")),
      body: favoriteQuestions.isEmpty
          ? const Center(child: Text("لا توجد أسئلة مفضلة بعد "))
          : ListView.builder(
        itemCount: favoriteQuestions.length,
        itemBuilder: (context, index) {
          final question = favoriteQuestions[index];
          return CardQuestion(
            index: index,
            numberItem: favoriteQuestions.length,
            radioFormExample:
            RadioFormExample(questionModel: question),
            click: true,
          );
        },
      ),
    );
  }
}
