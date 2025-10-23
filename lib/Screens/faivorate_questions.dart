import 'package:flutter/material.dart';
import '../Component/card_question.dart';
import '../Component/list_question_com.dart';
import '../Component/reactive_radio.dart';
import 'content_list_question.dart';

class FavoriteQuestions extends StatefulWidget {
  const FavoriteQuestions({super.key});

  @override
  State<FavoriteQuestions> createState() => _FavoriteQuestionsState();
}

class _FavoriteQuestionsState extends State<FavoriteQuestions> {

  void refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final favorites = FavoriteManager.favoriteIndexes;

    return Scaffold(
      appBar: AppBar(title: const Text("الأسئلة المفضلة")),
      body: favorites.isEmpty
          ? const Center(child: Text("لا توجد أسئلة مفضلة بعد"))
          : ListView(
        children: favorites.map((index) {
          return CardQuestion(
            index: index,
            numberItem: listQuestion.length,
            radioFormExample: RadioFormExample(
              questionModel: listQuestion[index],
            ),
            click: true,
            onStarToggle: () {
              FavoriteManager.toggleFavorite(index);
              refresh();
            },
          );
        }).toList(),
      ),
    );
  }
}
