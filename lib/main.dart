import 'package:amazon_clone/screens/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCaumYlfL3cJxQ9v2jpkkbRQnZeN3zuBjU",
            authDomain: "clone-706a1.firebaseapp.com",
            projectId: "clone-706a1",
            storageBucket: "clone-706a1.appspot.com",
            messagingSenderId: "913775616983",
            appId: "1:913775616983:web:bafa628b2238f7a85a2192"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: "Amazon Clone",
        theme:
            ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: const SignInScreen(),
      ),
      designSize: const Size(360, 800),
    );
  }
}
