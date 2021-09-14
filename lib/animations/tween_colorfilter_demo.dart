import 'package:flutter/material.dart';

class TweenColorFilterDemo extends StatelessWidget {
  const TweenColorFilterDemo({Key? key}) : super(key: key);
  static final colorTween = ColorTween(begin: Colors.white, end: Colors.red);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Background
        Image.network(
            'https://images.unsplash.com/photo-1506318137071-a8e063b4bec0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1540&q=80'),

        // Earth
        Center(
          child: TweenAnimationBuilder<Color>(
            tween: Tween<Color>(begin: Colors.red, end: Colors.white),
            duration: const Duration(seconds: 2),
            builder: (_, Color color, __) {
              return ColorFiltered(
                child: Image.network(
                    'https://images.unsplash.com/photo-1517461403273-99cbad26cc34?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1502&q=80'),
                colorFilter: ColorFilter.mode(
                  color,
                  BlendMode.modulate,
                ),
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


// class BackAndForth extends StatefulWidget {
//   @override
//   _BackAndForthState createState() => _BackAndForthState();
// }

// class _BackAndForthState extends State<MyHomePage> {
//   Color _newColor = Colors.red;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         starsBackground,
//         Center(
//           child: TweenAnimationBuilder(
//             tween: ColorTween(begin: Colors.white, end: _newColor),
//             duration: Duration(seconds: 2),
//             onEnd: () {
//               setState(() {
//                 _newColor = _newColor == Colors.red ? Colors.white : Colors.red;
//               });
//             },
//             builder: (_, Color color, __) {
//               return ColorFiltered(
//                 child: Image.asset('assets/sun.png'),
//                 colorFilter: ColorFilter.mode(color, BlendMode.modulate),
//               );
//             },
//           ),
//         )
//       ],
//     );
//   }
// }