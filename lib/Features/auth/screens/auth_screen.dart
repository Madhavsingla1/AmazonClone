import 'package:amazon/Common/widgets/custom_button.dart';
import 'package:amazon/Common/widgets/custom_textfield.dart';
import 'package:amazon/Features/auth/services/auth_service.dart';
import 'package:amazon/Utils/global_varibales.dart';
import 'package:flutter/material.dart';

enum AuthMode {
  signup,
  signin,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthMode _auth = AuthMode.signup;
  final AuthService _authService = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final _signupFormKey = GlobalKey<FormState>();
  final _signinFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signupUser() {
    _authService.signupUser(
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to Amazon',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            RadioListTile(
              tileColor: _auth == AuthMode.signup
                  ? Colors.white
                  : GlobalVariables.greyBackgroundCOlor,
              value: AuthMode.signup,
              groupValue: _auth,
              onChanged: (AuthMode? val) {
                setState(() {
                  _auth = val!;
                });
              },
              title: const Text('Create Account'),
              activeColor: GlobalVariables.secondaryColor,
            ),
            if (_auth == AuthMode.signup)
              Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _signupFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _nameController,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _emailController,
                        hintText: "Email",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "Password",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        text: 'SignUp',
                        onpressed: () {
                          if (_signupFormKey.currentState!.validate()) {
                            signupUser();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            RadioListTile(
              tileColor: _auth == AuthMode.signin
                  ? Colors.white
                  : GlobalVariables.greyBackgroundCOlor,
              value: AuthMode.signin,
              groupValue: _auth,
              onChanged: (AuthMode? val) {
                setState(() {
                  _auth = val!;
                });
              },
              title: const Text('Sign-in'),
              activeColor: GlobalVariables.secondaryColor,
            ),
            if (_auth == AuthMode.signin)
              Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _signinFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: "Email",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "Password",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(text: 'SignIn', onpressed: () {})
                    ],
                  ),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
