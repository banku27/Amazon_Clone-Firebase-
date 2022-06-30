import 'package:amazon_clone/resources/authentication_methods.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/screens/sign_up_screen.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
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

  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool isLoding = false;

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
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
                    height: 380.h,
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
                          height: 20.h,
                        ),
                        TextFieldWidget(
                            title: 'Password',
                            hintText: 'Enter your Password',
                            controller: passwordController,
                            obscureText: true),
                        SizedBox(
                          height: 20.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CustomMainButton(
                              child: const Text(
                                'Sign In',
                                style: TextStyle(color: Colors.black),
                              ),
                              color: yellowColor,
                              isLoading: isLoding,
                              onPressed: () async {
                                setState(() {
                                  isLoding = true;
                                });
                                String output =
                                    await authenticationMethods.signInUser(
                                        email: emailController.text,
                                        password: passwordController.text);
                                setState(() {
                                  isLoding = false;
                                });
                                if (output == 'success') {
                                } else {
                                  Utils().showSnackBar(
                                      context: context, content: output);
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 1.h,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: const Text(
                          'New to Amazon?',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1.h,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  CustomMainButton(
                      child: const Text(
                        'Create An Amazon Account',
                        style: TextStyle(color: Colors.black),
                      ),
                      color: Colors.grey[400]!,
                      isLoading: false,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SignUpScreen()));
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
