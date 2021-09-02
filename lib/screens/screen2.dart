import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    int value = 10;
    return Scaffold(
      body: Center(
        child: Text("Screen 2:  $value"),
      ),
    );
  }
}
