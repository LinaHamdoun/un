import 'dart:core';

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../models/question_model.dart';
import 'list_question_com.dart';

class RadioFormExample extends StatefulWidget {
  final QuestionModel questionModel;
  final bool showCorrectAnswers;

  const RadioFormExample({
    super.key,
    required this.questionModel,
    this.showCorrectAnswers = false,
  });

  @override
  State<RadioFormExample> createState() => _RadioFormExampleState();
}

class _RadioFormExampleState extends State<RadioFormExample> {
  late FormGroup form;
  String _selectedValue = '';

  @override
  void initState() {
    super.initState();
    form = buildForm();

    if (widget.showCorrectAnswers) {
      Future.delayed(Duration.zero, () {
        form.control(widget.questionModel.labelQuestion).value =
            widget.questionModel.correctAnswer;
      });
    }



    form.control(widget.questionModel.labelQuestion).valueChanges.listen((
      value,
    ) {
      if (value != null) {
        setState(() {
          _selectedValue = value;
        });
        final AnswerQuestion answer = AnswerQuestion(
          labelQuestion: widget.questionModel.labelQuestion,
          answerUser: value,
        );
        listAnswerUser.add(answer);
        for (var q in listAnswerUser) {
          print(q.answerUser);
        }
      }
    });
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }

  FormGroup buildForm() => FormGroup({
    widget.questionModel.labelQuestion: FormControl<String>(value: null),
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.questionModel.questionTxt,
              style: const TextStyle(color: Colors.amber, fontSize: 20),
            ),

            const SizedBox(height: 16),

            _buildRadioOption(widget.questionModel.txt1),
            _buildRadioOption(widget.questionModel.txt2),
            _buildRadioOption(widget.questionModel.txt3),
            _buildRadioOption(widget.questionModel.txt4),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioOption(String value) {
    bool isCorrect =
        widget.showCorrectAnswers &&
        value == widget.questionModel.correctAnswer;
    if (isCorrect)
      {
        form.control(widget.questionModel.labelQuestion).value = widget.questionModel.correctAnswer;


      }



    return SizedBox(
      width: 200,
      child: ReactiveRadioListTile<String>(activeColor:  isCorrect ? Colors.green : Colors.amber,
        formControlName: widget.questionModel.labelQuestion,

        title: Text(
          value,
          style: TextStyle(
            color: isCorrect ? Colors.green : Colors.grey,
            fontWeight: isCorrect ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        value: value,
      ),
    );
  }
}
