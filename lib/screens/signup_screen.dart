import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common_widgets/utils.dart';
import 'package:flutter_ecommerce_app/models/app_user_model.dart';
import 'package:flutter_ecommerce_app/screens/home_page.dart';
import 'package:flutter_ecommerce_app/services/authentication_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String userEmail = "abcd@codzify.com";
  String userPassword = "codzify";

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Register User"),
          onPressed: () async {
            // create a user with the provided email and pasword
            AppUser user1 = await _authService.createUserWithEmailAndPassword(
                userEmail, userPassword);

            pushAndReplaceWithAnotherPage(context, HomeScreen());

            // take other fields like name, age, school name, etc
            // add them to AppUser object
            // Push everything to the firebase firestore
            // The document id of the firebase should be the UID

            // print(user1.uid);
            // print(user1.displayName);
            // print(user1.photoURL);
            // print(user1.email);
          },
        ),
      ),
    );
  }
}
