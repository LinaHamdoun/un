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
