import 'package:amazon_clone/constants.dart';
import 'package:amazon_clone/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var h = MediaQuery.of(context).size.height;
    // var w = MediaQuery.of(context).size.width;
    // print(h);
    // print(w);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                amazonLogo,
                height: 50.h,
              ),
              Container(
                padding: const EdgeInsets.all(25),
                height: 360.h,
                width: 320.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.grey,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign-In',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 33.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFieldWidget(
                        hintText: 'Enter your Email',
                        title: 'Email',
                        controller: emailController,
                        obscureText: false),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextFieldWidget(
                        title: 'Password',
                        hintText: 'Enter your Password',
                        controller: passwordController,
                        obscureText: true)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
