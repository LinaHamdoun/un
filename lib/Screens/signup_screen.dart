import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/Colors/colors_screens.dart';

import '../Component/container.dart';
import '../Component/row_text.dart';
import '../Component/textField.dart';
import '../Component/text_top.dart';
import '../Component/validator.dart';
import 'create_account.dart';
import 'login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  late List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNodes[0].requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: ColorsScreens.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 70.h),
                SvgPicture.asset('assets/Logo/logos.svg'),
                SizedBox(height: 30.h),

                TextTop(text: 'خطواتك الأولى نحو التفوّق تبدأ هنا'),
                SizedBox(height: 25.h),

                TextFieldComponent(
                  controller: nameController,
                  validator: (String? value) => null,
                  text: 'الاسم الكامل',
                  focusNode: focusNodes[0],
                ),
                SizedBox(height: 10.h),
                TextFieldComponent(
                  controller: emailController,
                  validator: (String? value) => CustomValidators.email(value),
                  text: 'البريد الالكتروني',
                  focusNode: focusNodes[1],
                ),
                SizedBox(height: 10.h),

                TextFieldComponent(
                  controller: passwordController,
                  validator: (String? value) => CustomValidators.email(value),
                  text: 'كلمة المرور',
                  focusNode: focusNodes[2],
                ),
                SizedBox(height: 10.h),

                TextFieldComponent(
                  controller: confirmPasswordController,
                  validator: (String? value) =>
                      CustomValidators.confirmPassword(
                        value,
                        confirmPasswordController.text,
                      ),
                  text: 'تأكيد كلمة المرور',
                  focusNode: focusNodes[3],
                ),
                SizedBox(height: 30.h),

                ContainerComponent(
                  textContainer: 'تسجيل',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateAccount()),
                    );
                  },
                ),
                SizedBox(height: 5.h),

                TextRow(
                  text: 'هل لديك حساب بالفعل؟',
                  textButton: 'تسجيل الدخول',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogIn()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
