part of 'ui_cubit.dart';

@immutable
sealed class UiState {}

final class UiInitial extends UiState {}

final class FavoriteState extends UiState {
  final List<int> favorites;

  FavoriteState(this.favorites);
}


final class UiIconsToggled extends UiState {
  final bool isShow;

  UiIconsToggled(this.isShow);
}

final class UiAnswersRestart extends UiState {
  final List<AnswerQuestion> listAnswerUser;

  UiAnswersRestart(this.listAnswerUser);
}

final class UiShowCorrectAnswers extends UiState {
 final   bool showCorrect;

  UiShowCorrectAnswers(this.showCorrect);
}

final class UiAnswersReset extends UiState {
  final List<AnswerQuestion> listAnswerUser;
  final bool reset ;

  UiAnswersReset(this.listAnswerUser, this.reset);
}

final class UiCorrectAnswerUser extends UiState {
  final bool correctAnswerUser;

  UiCorrectAnswerUser(this.correctAnswerUser);
}



