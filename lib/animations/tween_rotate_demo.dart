import 'package:flutter/material.dart';
import 'dart:math' as math;

class TweenRotateDemo extends StatelessWidget {
  const TweenRotateDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Background
        Image.network(
            'https://images.unsplash.com/photo-1506318137071-a8e063b4bec0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1540&q=80'),

        // Earth
        Center(
          child: TweenAnimationBuilder<double>(
            // 1
            duration: const Duration(seconds: 2),

            // 2
            tween: Tween<double>(begin: 2 * math.pi, end: 0),

            // 3
            builder: (x, angle, y) {
              return Transform.rotate(
                angle: angle,
                child: Image.network(
                    'https://images.unsplash.com/photo-1614730321146-b6fa6a46bcb4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1567&q=80'),
              );
            },
          ),
        ),
      ],
    );
  }
}

// select a widget
// choose the property 
// change the property once...by hand
// instead of for loop, we will wrap that widget with TweenAnimationBuilder
// BeTWEEN: 
// 
// 0 to 90


// StreamBuilder : stream, builder
// TweenAnimationBuilder : tween, duration, builder