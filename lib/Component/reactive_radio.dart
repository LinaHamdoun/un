import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../models/question_model.dart';



class RadioFormExample extends StatelessWidget {
  final  QuestionModel questionModel ;

  const RadioFormExample({super.key, required this.questionModel});

  FormGroup buildForm() => FormGroup( {

    questionModel.labelQuestion :  FormControl<String>(
      value: null,
    )

  });




  @override
  Widget build(BuildContext context) {

    final form = buildForm();

return  ReactiveForm(
        formGroup: form,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child:
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text( questionModel.questionTxt
                ,
                style: const TextStyle(color: Colors.amber, fontSize: 20),
              ),
              const SizedBox(height: 16),


              SizedBox(
                width: 200,
                child: ReactiveRadioListTile<String>(
                  formControlName: questionModel.labelQuestion,
                  title:  Text(questionModel.txt1),
                  value: questionModel.txt1,
                ),
              ),
              SizedBox(
                width: 200,

                child: ReactiveRadioListTile<String>(
                  formControlName: questionModel.labelQuestion,
                  title:  Text(questionModel.txt2),
                  value: questionModel.txt2,
                ),
              ),
              SizedBox(
                width: 200,

                child: ReactiveRadioListTile<String>(
                  formControlName: questionModel.labelQuestion,
                  title:  Text(questionModel.txt3),
                  value: questionModel.txt3,
                ),
              ),
              SizedBox(
                width: 200,

                child: ReactiveRadioListTile<String>(
                  formControlName: questionModel.labelQuestion,
                  title:  Text(questionModel.txt4),
                  value: questionModel.txt4,
                ),
              ),



              const SizedBox(height: 20),
            ],
          ),
        ),
      );
  }
}






