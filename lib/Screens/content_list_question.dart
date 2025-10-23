import 'package:flutter/material.dart';
import '../Component/card_question.dart';
import '../Component/list_question_com.dart';
import '../Component/reactive_radio.dart';
import 'faivorate_questions.dart';

class ContentListQuestion extends StatefulWidget {
  const ContentListQuestion({super.key});

  @override
  State<ContentListQuestion> createState() => _ContentListQuestionState();
}

class _ContentListQuestionState extends State<ContentListQuestion> {

  void refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الأسئلة"),
        actions: [
          IconButton(
            icon: const Icon(Icons.star, color: Colors.amber),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FavoriteQuestions()),
              ).then((_) => setState(() {}));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listQuestion.length,
        itemBuilder: (context, index) {
          bool isFavorite = FavoriteManager.isFavorite(index);

          return CardQuestion(
            index: index,
            numberItem: listQuestion.length,
            radioFormExample: RadioFormExample(
              questionModel: listQuestion[index],
            ),
            click: isFavorite,
            onStarToggle: () {
              FavoriteManager.toggleFavorite(index);
              refresh();
            },
          );
        },
      ),
    );
  }
}

class FavoriteManager {
  static final List<int> favoriteIndexes = [];

  static void toggleFavorite(int index) {
    if (favoriteIndexes.contains(index)) {
      favoriteIndexes.remove(index);
    } else {
      favoriteIndexes.add(index);
    }
  }

  static bool isFavorite(int index) {
    return favoriteIndexes.contains(index);
  }
}

