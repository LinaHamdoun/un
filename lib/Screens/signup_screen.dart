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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,

      child: Scaffold(
        backgroundColor: Colors.white,
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
                  validator: (String? value) => CustomValidators.name(value),
                  text: 'الاسم الكامل',
                ),
                SizedBox(height: 10.h),
                TextFieldComponent(
                  controller: emailController,
                  validator: (String? value) => CustomValidators.email(value),
                  text: 'البريد الالكتروني',
                ),
                SizedBox(height: 10.h),

                TextFieldComponent(
                  controller: passwordController,
                  validator: (String? value) =>
                      CustomValidators.password(value),
                  text: 'كلمة المرور',
                ),
                SizedBox(height: 10.h),

                TextFieldComponent(
                  controller: confirmPasswordController,
                  validator: (String? value) =>
                      CustomValidators.confirmPassword(
                        value,
                        passwordController.text,
                      ),
                  text: 'تأكيد كلمة المرور',
                ),
                SizedBox(height: 30.h),

                ContainerComponent(
                  textContainer: 'تسجيل',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAccount(),
                        ),
                      );
                    }
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
