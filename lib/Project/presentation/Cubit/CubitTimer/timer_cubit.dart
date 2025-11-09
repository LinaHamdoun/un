import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {

  Timer? _timer;
  int seconds = 0;
  bool _isClosed = true;

  TimerCubit() : super(TimerInitial()) ;


  void startTimer() {
    _timer?.cancel();
    _isClosed = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      seconds++;
      emit(TimerRunning(seconds, _isClosed));
    });
  }

  void resetTimer() {
    _timer?.cancel();
    seconds = 0;
    startTimer();
  }
//
  void closeTimer() {
    _timer?.cancel();
    seconds = 0;
    _isClosed = true;
    emit(TimerRunning(seconds, _isClosed));
  }
  //

  void showTimer() {
    _timer?.cancel();
    seconds = 0;
    _isClosed = !_isClosed;
    emit(TimerRunning(seconds, _isClosed));
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


}
