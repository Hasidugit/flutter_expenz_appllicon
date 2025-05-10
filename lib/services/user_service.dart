import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  static Future<void> storeUSerDetails(
    String userName,
    String email,
    String password,
    String confirmPassword,
    BuildContext context,
  ) async {
    try {
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Password and confirmpassword do not match")),
        );
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("username", userName);
      await prefs.setString("email", email);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User Details stored successfully")),
      );
    } catch (e) {
      e.toString();
    }
  }

  // method to check user anme is save or not
  static Future<bool> checkUSerName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString("username");
    return userName != null;
  }

  static Future<Map<String, String>> getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userName = pref.getString("username");
    String? email = pref.getString("email");

    return {"username": userName!, "email": email!};
  }
}
