import 'package:flutter/material.dart';

class Users extends ChangeNotifier{
  Map<String, List<String>> storeUsers = {};
  String? loggedInUser;  

  void register(String username, String mobileOrEmail, String password, String dob){
    List<String> userDetails = [];
    userDetails.addAll([username, password, dob]);
    storeUsers.putIfAbsent(mobileOrEmail, () => userDetails);
    notifyListeners();
  }
}