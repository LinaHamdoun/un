import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/question_model.dart';

part 'ui_state.dart';

class UiCubit extends Cubit<UiState> {
  final List<int> _favorites = [];
  Timer? _timer;
  int _seconds = 0;
  bool _isClosed = true;
  bool isShow = false;
  List<AnswerQuestion> listAnswerUser = [];
  bool showCorrect = false;

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

  void startTimer() {
    _timer?.cancel();
    _isClosed = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _seconds++;
      emit(TimerRunning(_seconds, _isClosed));
    });
  }

  void resetTimer() {
    _timer?.cancel();
    _seconds = 0;
    startTimer();
  }

  void closeTimer() {
    _timer?.cancel();
    _seconds = 0;
    _isClosed = true;
    emit(TimerRunning(_seconds, _isClosed));
  }

  void showTimer() {
    _timer?.cancel();
    _seconds = 0;
    _isClosed = false;
    emit(TimerRunning(_seconds, _isClosed));
  }

  void disposeTimer() {
    _timer?.cancel();
  }

  String formatTime(int totalSeconds) {
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int secs = totalSeconds % 60;
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(hours)} : ${twoDigits(minutes)} : ${twoDigits(secs)}";
  }

  void toggleIcons() {
    isShow = !isShow;
    emit(UiIconsToggled(isShow));
  }

  void addAnswer(AnswerQuestion answer) {
    listAnswerUser.removeWhere((a) => a.labelQuestion == answer.labelQuestion);

    listAnswerUser.add(answer);

    print(" إجابات المستخدم:");
    for (var q in listAnswerUser) {
      print("${q.labelQuestion}: ${q.answerUser}");
    }

    emit(UiAnswersReset(List.from(listAnswerUser)));
  }

  void resetAll() {
    listAnswerUser.clear();
    emit(UiAnswersReset([]));
  }

  void toggleShowCorrect() {
    showCorrect = !showCorrect;
    emit(UiShowCorrectAnswers(showCorrect));
  }


}
