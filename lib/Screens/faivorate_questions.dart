import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Component/card_question.dart';
import '../Component/list_question_com.dart';
import '../Component/reactive_radio.dart';
import '../Cubit/ui_cubit.dart';

class FavoriteQuestions extends StatelessWidget {
  const FavoriteQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UiCubit>();
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<UiCubit, UiState>(
          builder: (context, state) {
            List favorites = cubit.favorites;
            if ( state is FavoriteState)  {
        
              favorites = state.favorites ;
            }
        
            if (favorites.isNotEmpty) {
              return ListView(
                children: favorites.map((index) {
                  return CardQuestion(
                    index: index,
                    numberItem: listQuestion.length,
                    radioFormExample: RadioFormExample(
                      questionModel: listQuestion[index],
        
                      showCorrectAnswers: cubit.showCorrect,
        
                      correctAnswerUser: cubit.correctAnswerUser,
        
                      reset: cubit.reset,
                    ),
                    click: true,
                    onStarToggle: () {
                      context.read<UiCubit>().toggleFavorite(index);
                    },
                  );
                }).toList(),
              );
            } else {
              return const Center(child: Text("لا توجد أسئلة مفضلة بعد"));
            }
          },
        ),
      ),
    );
  }
}
