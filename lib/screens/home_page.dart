import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common_widgets/utils.dart';
import 'package:flutter_ecommerce_app/screens/signin_screen.dart';
import 'package:flutter_ecommerce_app/services/authentication_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AuthService _authService = AuthService();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 1
          Center(
            child: Text("Home Page"),
          ),

          // 2
          ElevatedButton(
            onPressed: () {
              _authService.signOut();
              pushAndReplaceWithAnotherPage(context, SignInScreen());
            },
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
