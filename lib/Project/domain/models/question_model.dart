import 'package:flutter/material.dart';

class QuestionModel {
  final String txt1;
  final String txt2;
  final String txt3;
  final String txt4;
  final String questionTxt;
  final String correctAnswer;
  final String labelQuestion ;

  QuestionModel({
    required this.labelQuestion,
    required this.txt1,
    required this.txt2,
    required this.txt3,
    required this.txt4,
    required this.questionTxt,
    required this.correctAnswer,

  });
}
class AnswerQuestion {
  String labelQuestion ;
   String answerUser ;
  AnswerQuestion({required this.labelQuestion,required  this.answerUser,} );


}

extension NavigatorExtension on BuildContext {
  Future<T?> pushPage<T>(Widget page) {
   return Navigator.push(
      this,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween(
              begin: Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            )),
            child: child,
          );
        },
      ),
    );

  }

}