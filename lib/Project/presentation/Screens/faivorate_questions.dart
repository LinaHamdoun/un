import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Project/domain/models/question_model.dart';
import 'package:untitled/Project/presentation/Colors/colors_screens.dart';
import 'package:untitled/Project/presentation/Screens/test_screen.dart';

import '../Component/card_question.dart';
import '../Component/container_icon.dart';
import '../Component/list_question_com.dart';
import '../Component/reactive_radio.dart';
import '../Component/text_top.dart';
import '../Cubit/ui_cubit.dart';

class FavoriteQuestions extends StatelessWidget {
  const FavoriteQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UiCubit>();
    return Scaffold(
      backgroundColor: ColorsScreens.black,
      body: SafeArea(
        child: BlocBuilder<UiCubit, UiState>(
          builder: (context, state) {
            List favorites = cubit.favorites;
            if ( state is FavoriteState)  {
        
              favorites = state.favorites ;
            }
        
            if (favorites.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only( right: 5 , left: 5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10 , right: 10 , left: 10 , top : 5),
                      child: Row(
                        children: [
                          ContainerIcon(
                            onTap: () =>  Navigator.pop(context),
                            valueRadius: 10.r,
                            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                            color: Colors.white,
                          ),
                          Spacer(flex: 1),
                          TextTop(text:'المفضلة'),
                        ],
                      ),
                    ),

                    Expanded(
                      child: ListView(
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
                      ),
                    ),
                  ],
                ),
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
