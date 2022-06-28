import 'package:amazon_clone/screens/sign_in_screen.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: "Amazon Clone",
        theme: ThemeData.light()
            .copyWith(scaffoldBackgroundColor: backgroundColor),
        debugShowCheckedModeBanner: false,
        home: const SignInScreen(),
      ),
      designSize: const Size(360, 800),
    );
  }
}
