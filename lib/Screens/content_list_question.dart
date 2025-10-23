import 'package:flutter/material.dart';
import 'package:untitled/Component/reactive_radio.dart';
import 'package:untitled/Component/card_question.dart';
import 'package:untitled/Component/list_question_com.dart';
import 'package:untitled/Screens/faivorate_questions.dart';
import 'package:untitled/models/question_model.dart';

class ContentListQuestion extends StatefulWidget {
  const ContentListQuestion({super.key});

  @override
  State<ContentListQuestion> createState() => _ContentListQuestionState();
}

class _ContentListQuestionState extends State<ContentListQuestion> {
  final List<QuestionModel> favoriteList = [];

  void toggleFavorite(QuestionModel question) {
    setState(() {
      if (favoriteList.contains(question)) {
        favoriteList.remove(question);
      } else {
        favoriteList.add(question);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("قائمة الأسئلة")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  FavoriteQuestions(favoriteQuestions: favoriteList),
            ),
          );
        },
        child: const Icon(Icons.favorite),
      ),
      body: ListView.builder(
        itemCount: listQuestion.length,
        itemBuilder: (context, index) {
          final question = listQuestion[index];
          final isFavorite = favoriteList.contains(question);

          return CardQuestion(
            index: index,
            numberItem: listQuestion.length,
            radioFormExample:
            RadioFormExample(questionModel: listQuestion[index]),
            click: isFavorite,
            onFavoriteTap: () => toggleFavorite(question),
          );
        },
      ),
    );
  }
}
