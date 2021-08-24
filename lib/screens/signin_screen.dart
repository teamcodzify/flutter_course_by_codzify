import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common_widgets/utils.dart';
import 'package:flutter_ecommerce_app/models/app_user_model.dart';
import 'package:flutter_ecommerce_app/screens/home_page.dart';
import 'package:flutter_ecommerce_app/screens/signup_screen.dart';
import 'package:flutter_ecommerce_app/services/authentication_service.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    AuthService _authService = AuthService();
    String userEmail = "abc@codzify.com";
    String userPassword = "codzify";

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("Sign In Screen"),
          ),
          ElevatedButton(
            onPressed: () async {
              AppUser? user1 = await _authService.signInWithEmailAndPassword(
                  userEmail, userPassword);

              if (user1 == null) {
                print("User does not exist. Please register.");
                pushToAnotherPage(context, const SignUpScreen());
              } else {
                pushToAnotherPage(context, HomeScreen());
              }
            },
            child: Text("SignIn"),
          ),
        ],
      ),
    );
  }
}
