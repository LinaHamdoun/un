import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/Project/domain/models/question_model.dart';
import 'package:untitled/Project/presentation/Screens/signup_screen.dart';
import '../Component/container.dart';
import '../Component/row_text.dart';
import '../Component/textField.dart';
import '../Component/text_top.dart';
import '../Component/validator.dart';
import 'home_screen.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //ColorsScreens.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: formKey,
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
        
                  TextFieldComponent(
                    controller: emailController,
                    validator: (String? value) => CustomValidators.email(value),
        
                    text: 'البريد الإلكتروني',
                  ),
                  SizedBox(height: 20.h),
        
                  TextFieldComponent(
                    controller: passwordController,
                    validator: (String? value) =>
                        CustomValidators.password(value),
        
                    text: 'كلمة المرور',
                  ),
                  SizedBox(height: 5.h),
        
                  TextRow(
                    text: 'هل نسيت كلمة المرور؟',
                    textButton: 'إعادة تعيين',
                    onTap: () {},
                  ),
                  SizedBox(height: 30.h),
        
                  ContainerComponent(
                    textContainer: 'طلب تسجيل الدخول',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.pushPage(HomeScreen());
        
                      }
                      context.pushPage(HomeScreen());
        
                    },
                  ),
                  SizedBox(height: 5.h),
        
                  TextRow(
                    text: 'ليس لديك حساب؟',
                    textButton: 'سجل الآن',
                    onTap: ()=> context.pushPage(SignUp()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
