import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  late List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
  late List<TextEditingController> controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  void _onBackspace(KeyEvent event, int index) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace &&
        controllers[index].text.isEmpty &&
        index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNodes[0].requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(6, (index) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Focus(
              onKeyEvent: (node, event) {
                _onBackspace(event, index);
                return KeyEventResult.ignored;
              },
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                validator: (value) {},

                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                controller: controllers[index],
                focusNode: focusNodes[index],
                textAlign: TextAlign.center,

                maxLength: 1,
                decoration: InputDecoration(
                  counterText: '',
                  contentPadding: EdgeInsets.symmetric(vertical: 15.h),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty && index < 5) {
                    focusNodes[index + 1].requestFocus();
                  }
                  if (value.isEmpty && index > 0) {
                    focusNodes[index - 1].requestFocus();
                  }
                },
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    for (var node in focusNodes) node.dispose();
    for (var controller in controllers) controller.dispose();
    super.dispose();
  }
}
