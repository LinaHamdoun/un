import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../models/question_model.dart';
import 'list_question_com.dart';

class RadioFormExample extends StatefulWidget {
  final QuestionModel questionModel;

  const RadioFormExample({super.key, required this.questionModel});

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

    form.control(widget.questionModel.labelQuestion).valueChanges.listen((
      value,
    ) {
      if (value != null) {
        setState(() {
          _selectedValue = value;
        });
        if (!answerUser.contains(value)) {
          answerUser.add(value);
        }

        print('$value');
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
    return SizedBox(
      width: 200,
      child: ReactiveRadioListTile<String>(
        formControlName: widget.questionModel.labelQuestion,
        title: Text(value),
        value: value,
      ),
    );
  }
}
