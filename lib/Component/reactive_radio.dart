import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../Cubit/ui_cubit.dart';
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

  @override
  void initState() {
    super.initState();
    form = buildForm();

    // تعيين الإجابة الصحيحة إذا كان المطلوب إظهارها
    if (widget.showCorrectAnswers) {
      Future.delayed(Duration.zero, () {
        form.control(widget.questionModel.labelQuestion).value =
            widget.questionModel.correctAnswer;
      });
    }

    // نراقب تغيّر قيمة الـ radio بعد أن تُبنى الواجهة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      form
          .control(widget.questionModel.labelQuestion)
          .valueChanges
          .listen((value) {
        if (value != null) {
          final answer = AnswerQuestion(
            labelQuestion: widget.questionModel.labelQuestion,
            answerUser: value,
          );

          // الآن يمكننا استخدام context بأمان ✅
          context.read<UiCubit>().addAnswer(answer);
        }
      });
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

    final formControl = form.control(widget.questionModel.labelQuestion);
    final isSelected = formControl.value == value;

    Color textColor;
    if (isCorrect) {
      textColor = Colors.green;
    } else if (isSelected) {
      textColor = Colors.amber;
    } else {
      textColor = Colors.grey;
    }

    return SizedBox(
      width: 200,
      child: ReactiveRadioListTile<String>(
        formControlName: widget.questionModel.labelQuestion,
        value: value,
        activeColor: isCorrect ? Colors.green : Colors.amber,
        title: Text(
          value,
          style: TextStyle(
            color: textColor,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
