import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common_widgets/utils.dart';
import 'package:flutter_ecommerce_app/screens/walkthrough_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    openStartPage();
    super.initState();
  }

  Future<void> openStartPage() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        pushAndReplaceWithAnotherPage(
          context,
          const WalkthroughScreen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 150,
          width: 150,
          color: Colors.blue[700],
        ),
      ),
    );
  }
}
