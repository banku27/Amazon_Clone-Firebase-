import 'package:amazon_clone/models/user_model_details.dart';
import 'package:amazon_clone/resources/cloud_firestore_methods.dart';
import 'package:flutter/cupertino.dart';

class UserDetailProvider with ChangeNotifier {
  UserDetailsModel userDetails;
  UserDetailProvider()
      : userDetails = UserDetailsModel(name: 'Pankaj', address: 'Manali');

  Future getData() async {
    userDetails = await CloudFirestoreClass().getNameAndAddress();
    notifyListeners();
  }
}
