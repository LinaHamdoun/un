import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/models/question_model.dart';

part 'ui_state.dart';

class UiCubit extends Cubit<UiState> {
  final List<int> _favorites = [];
  bool isShow = false;
  List<AnswerQuestion> listAnswerUser = [];
  bool showCorrect = false;
  bool reset = false;
  bool correctAnswerUser = false;
  int currentIndex = 0;

  UiCubit() : super(UiInitial()) {
    _loadFavorites();
  }

  // Getter
  List<int> get favorites => List<int>.from(_favorites);

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('favorites') ?? [];
    _favorites
      ..clear()
      ..addAll(saved.map(int.parse));

    emit(FavoriteState(List<int>.from(_favorites)));
  }

  void toggleFavorite(int index) async {
    if (_favorites.contains(index)) {
      _favorites.remove(index);
    } else {
      _favorites.add(index);
    }

    emit(FavoriteState(List<int>.from(_favorites)));

    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'favorites',
      _favorites.map((e) => e.toString()).toList(),
    );
  }

  bool isFavorite(int index) => _favorites.contains(index);

  void toggleIcons() {
    isShow = !isShow;
    emit(UiIconsToggled(isShow));
  }

  void addAnswer(AnswerQuestion answer) {
    listAnswerUser.removeWhere((a) => a.labelQuestion == answer.labelQuestion);

    if (!showCorrect) {
      listAnswerUser.add(answer);
    }

    print("📋 إجابات المستخدم:");
    for (var q in listAnswerUser) {
      print("${q.labelQuestion}: ${q.answerUser}");
    }

    emit(UiAnswersRestart(List.from(listAnswerUser)));
  }

  void resetAll() {
    listAnswerUser.clear();
    showCorrect = false;
    correctAnswerUser = false;
    reset = true;
    emit(UiAnswersReset([], reset));
  }

  void toggleShowCorrect() {
    showCorrect = true;
    reset = false;

    emit(UiShowCorrectAnswers(showCorrect));
  }

  (Color textColor, Color? activeColor) getOptionColors({
    required bool isSelected,
    required bool isCorrectValue,
  }) {

    if (showCorrect && isCorrectValue) {
      return (Colors.green, Colors.green);
    }

    if (correctAnswerUser) {
      if (isSelected && isCorrectValue) return (Colors.green, Colors.green);
      if (isSelected && !isCorrectValue) return (Colors.red, Colors.red);
      return (Colors.grey, Colors.grey);
    }

    if (isSelected && reset) {
      return (Colors.amber, Colors.amber);
    }

    if (isSelected) {
      return (Colors.amber, Colors.amber);
    }

    return (Colors.grey, null);
  }

  void funCorrectAnswerUser() {
    correctAnswerUser = true;
    emit(UiCorrectAnswerUser(correctAnswerUser));
  }


  void onItemTapped(int index) {


    emit(OnItemTapped(index));
  }


}
