import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common_widgets/config.dart';
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
      appBar: AppBar(
        actions: [
          // 1
          IconButton(
            onPressed: () => currentTheme.toggleTheme(),
            icon: const Icon(Icons.lightbulb_outline, size: 24.0),
          ),

          // 2
          const SizedBox(width: 8.0),

          // 3
          TextButton(
            onPressed: () {
              _authService.signOut();
              pushAndReplaceWithAnotherPage(context, SignInScreen());
            },
            child: const Text("Logout"),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // 1
          const Center(
            child: Text("Home Page"),
          ),

          //
          ElevatedButton(
            onPressed: () {},
            child: const Text("Click Me"),
          )
        ],
      ),
    );
  }
}
