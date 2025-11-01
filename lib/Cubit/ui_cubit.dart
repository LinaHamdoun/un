import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/question_model.dart';

part 'ui_state.dart';

class UiCubit extends Cubit<UiState> {
  final List<int> _favorites = [];
  bool isShow = false;
  List<AnswerQuestion> listAnswerUser = [];
  bool showCorrect = false;
  bool reset = false;
  bool correctAnswerUser = false;

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

    emit(UiAnswersReset(List.from(listAnswerUser)));
  }

  void resetAll() {
    listAnswerUser.clear();
    reset = !reset;
    emit(UiAnswersRestart([]));
  }

  void toggleShowCorrect() {
    showCorrect = !showCorrect;

    emit(UiShowCorrectAnswers(showCorrect));
  }

  void funCorrectAnswerUser() {
    correctAnswerUser = !correctAnswerUser;
    emit(UiCorrectAnswerUser(correctAnswerUser));
  }
}
