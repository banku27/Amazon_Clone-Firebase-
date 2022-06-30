import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<String> signUpUser({
    required String name,
    required String address,
    required String email,
    required String password,
  }) async {
    // to avoid spaces
    name.trim();
    address.trim();
    email.trim();
    password.trim();

    String output = 'Something Went Wrong';

    if (name != "" && address != "" && email != "" && password != "") {
      //functions
      output = 'success';
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        output = 'success';
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      //error
      output = 'Please fill up all the fields.';
    }
    return output;
  }

  Future<String> signInUser({
    required String email,
    required String password,
  }) async {
    // to avoid spaces

    email.trim();
    password.trim();

    String output = 'Something Went Wrong';

    if (email != "" && password != "") {
      //functions
      output = 'success';
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        output = 'success';
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      //error
      output = 'Please fill up all the fields.';
    }
    return output;
  }
}
