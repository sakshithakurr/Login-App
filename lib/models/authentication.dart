import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Authentication with ChangeNotifier {
  Future<void> registerUser(
      String name, String contact, String email, String password) async {
    const url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBY5d8-cZ4Xxv7C2ZzV_dBXQYqJ3e-7iY4";
    final response = await http.post(url,
        body: jsonEncode({
          'name': name,
          'contact': contact,
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
    final responseData = jsonDecode(response.body);
    print(responseData);
  }

  Future<void> loginUser(String email, String password) async {
    const url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBY5d8-cZ4Xxv7C2ZzV_dBXQYqJ3e-7iY4";
    try {
      final response = await http.post(url,
          body: jsonEncode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = jsonDecode(response.body);
      print(responseData);
    } catch (error) {
      throw error;
    }
  }
}
