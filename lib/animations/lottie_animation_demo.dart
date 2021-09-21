import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationDemo extends StatefulWidget {
  const LottieAnimationDemo({Key? key}) : super(key: key);

  @override
  _LottieAnimationDemoState createState() => _LottieAnimationDemoState();
}

class _LottieAnimationDemoState extends State<LottieAnimationDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.red),
              );
            },
          );
        },
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            child: Lottie.network(
                'https://assets2.lottiefiles.com/packages/lf20_2kHQhR.json'),
          ),
        ),
      ),
    );
  }
}
