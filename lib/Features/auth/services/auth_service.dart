import 'dart:convert';

import 'package:amazon/Utils/error_handling.dart';
import 'package:amazon/Utils/global_varibales.dart';
import 'package:amazon/Utils/utility.dart';
import 'package:flutter/widgets.dart';
import '../../../Models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // sign up user

  void signupUser({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    try {
      User user = User(
          id: "",
          name: name,
          email: email,
          password: password,
          address: '',
          type: "",
          token: "");

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: json.encode(user.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // print(res.body);
      // print(res.statusCode);
      httpErrorhandle(
          response: res,
          context: context,
          onSuccess: () {
            showsnackbar(context, 'Account created successfully');
          });
    } catch (e) {
      showsnackbar(
        context,
        e.toString(),
      );
    }
  }

  // sign in user
}
