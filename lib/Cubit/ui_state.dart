part of 'ui_cubit.dart';

@immutable
sealed class UiState {}

final class UiInitial extends UiState {}

final class FavoriteState extends UiState {
  final List<int> favorites;

  FavoriteState(this.favorites);
}

class TimerRunning extends UiState {
  final int seconds;
  final bool isClosed;

  TimerRunning(this.seconds, this.isClosed);
}

final class UiIconsToggled extends UiState {
  final bool isShow;
  UiIconsToggled(this.isShow);
}

final class UiAnswersReset extends UiState {
  final List<AnswerQuestion> listAnswerUser;
  UiAnswersReset(this.listAnswerUser);
}

final class UiShowCorrectAnswers extends UiState {
  final bool showCorrect;
  UiShowCorrectAnswers(this.showCorrect);
}

