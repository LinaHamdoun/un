import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../Cubit/ui_cubit.dart';
import '../models/question_model.dart';

class RadioFormExample extends StatefulWidget {
  final QuestionModel questionModel;
  final bool showCorrectAnswers;
  final bool correctAnswerUser;

  final bool reset;

  const RadioFormExample({
    super.key,
    required this.questionModel,
    required this.showCorrectAnswers,
    required this.correctAnswerUser,
    required this.reset,
  });

  @override
  State<RadioFormExample> createState() => _RadioFormExampleState();
}

class _RadioFormExampleState extends State<RadioFormExample> {
  late FormGroup form;
  String? _userAnswer;

  @override
  void initState() {
    super.initState();
    form = buildForm();

    if (widget.showCorrectAnswers) {
      Future.delayed(Duration.zero, () {
        form.control(widget.questionModel.labelQuestion).value =
            widget.questionModel.correctAnswer;
      });
      form.control(widget.questionModel.labelQuestion).markAsDisabled();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      form.control(widget.questionModel.labelQuestion).valueChanges.listen((
        value,
      ) {
        if (value != null) {
          final answer = AnswerQuestion(
            labelQuestion: widget.questionModel.labelQuestion,
            answerUser: value,
          );
          context.read<UiCubit>().addAnswer(answer);
        }
      });
    });
  }

  FormGroup buildForm() => FormGroup({
    widget.questionModel.labelQuestion: FormControl<String>(value: null),
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<UiCubit, UiState>(
      listenWhen: (previous, current) {
        return current is UiShowCorrectAnswers || current is UiAnswersReset;
      },
      listener: (context, state) {
        final cubit = context.read<UiCubit>();
        final control =
            form.control(widget.questionModel.labelQuestion)
                as FormControl<String?>?;
        if (control == null) return;

        if (state is UiAnswersReset) {
          _userAnswer = null;
          control
            ..markAsEnabled()
            ..reset()
            ..updateValueAndValidity();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            control.updateValueAndValidity();
          });
          return;
        }

        if (state is UiShowCorrectAnswers && state.showCorrect) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            control.value = widget.questionModel.correctAnswer;
            control.updateValueAndValidity();
          });
        }
      },
      child: ReactiveForm(
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
      ),
    );
  }

  Widget _buildRadioOption(String value) {
    final formControl = form.control(widget.questionModel.labelQuestion);
    final isSelected = formControl.value == value;
    final isCorrectValue = value == widget.questionModel.correctAnswer;

    final cubit = context.read<UiCubit>();
    final (textColor, activeColor) = cubit.getOptionColors(
      isSelected: isSelected,
      isCorrectValue: isCorrectValue,
    );

    return SizedBox(
      width: 220,
      child: ReactiveRadioListTile<String>(
        formControlName: widget.questionModel.labelQuestion,
        value: value,
        activeColor: activeColor,
        title: Text(
          value,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
