import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    int value = 10;
    return Scaffold(
      body: Center(
        child: Text("Screen 3:  $value"),
      ),
    );
  }
}
