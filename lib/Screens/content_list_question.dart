import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Component/card_question.dart';
import '../Component/list_question_com.dart';
import '../Component/reactive_radio.dart';
import '../Cubit/ui_cubit.dart';
import 'faivorate_questions.dart';

class ContentListQuestion extends StatelessWidget {
  final bool showCorrectAnswers;
  final bool correctAnswerUser;
  final bool reset ;

  const ContentListQuestion({super.key, this.showCorrectAnswers = false, required this.correctAnswerUser, required this.reset});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UiCubit, UiState>(
      builder: (context, state) {
        final favorites = state is FavoriteState ? state.favorites : <int>[];

        return ListView.builder(
          itemCount: listQuestion.length,
          itemBuilder: (context, index) {
            final isFavorite = favorites.contains(index);

            return CardQuestion(
              index: index,
              numberItem: listQuestion.length,
              radioFormExample: RadioFormExample(
                showCorrectAnswers: showCorrectAnswers,
                questionModel: listQuestion[index], correctAnswerUser: correctAnswerUser, reset: reset ,
              ),
              click: isFavorite,
              onStarToggle: () {
                context.read<UiCubit>().toggleFavorite(index);
              },
            );
          },
        );
      },
    );
  }
}
