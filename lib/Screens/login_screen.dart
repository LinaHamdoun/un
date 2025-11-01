import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/Screens/signup_screen.dart';

import '../Colors/colors_screens.dart';
import '../Component/container.dart';
import '../Component/row_text.dart';
import '../Component/textField.dart';
import '../Component/text_top.dart';
import '../Component/validator.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late List<FocusNode> focusNodes = List.filled(2, FocusNode());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNodes[0].requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsScreens.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 78.h),
                SvgPicture.asset(
                  'assets/Logo/logos.svg',
                  height: 110.h,
                  width: 100.w,
                ),
                SizedBox(height: 40.h),

                TextTop(text: 'جاهز لتحقيق أفضل النتائج؟سجل دخولك الآن'),
                SizedBox(height: 20.h),

                /// حقل البريد الإلكتروني
                TextFieldComponent(
                  controller: emailController,
                  validator: (String? value) {
                    return CustomValidators.email(value);
                  },
                  text: 'البريد الإلكتروني',
                  focusNode: focusNodes[0],
                ),
                SizedBox(height: 20.h),

                /// حقل كلمة المرور
                TextFieldComponent(
                  controller: passwordController,
                  validator: (String? value) {
                    return CustomValidators.password(value);
                  },
                  text: 'كلمة المرور',
                  focusNode: focusNodes[1],
                ),
                SizedBox(height: 5.h),

                TextRow(
                  text: 'هل نسيت كلمة المرور؟',
                  textButton: 'إعادة تعيين',
                  onTap: () {},
                ),
                SizedBox(height: 30.h),

                /// زر تسجيل الدخول
                ContainerComponent(
                  textContainer: 'طلب تسجيل الدخول',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      print('تم التحقق بنجاح');
                    } else {
                      print('تحقق من الحقول');
                    }

                  },
                ),
                SizedBox(height: 5.h),

                TextRow(
                  text: 'ليس لديك حساب؟',
                  textButton: 'سجل الآن',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
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
