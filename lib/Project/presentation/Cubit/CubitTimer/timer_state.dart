part of 'timer_cubit.dart';

@immutable
sealed class TimerState {}


final class TimerInitial extends TimerState {}

class TimerRunning  extends TimerState {
  final int   seconds;
  final bool  isClosed;

   TimerRunning(this.seconds, this.isClosed);
}
