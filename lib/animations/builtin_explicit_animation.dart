import 'package:flutter/material.dart';

class BuiltinExplictAnimationDemo extends StatefulWidget {
  const BuiltinExplictAnimationDemo({Key? key}) : super(key: key);

  @override
  _BuiltinExplictAnimationDemoState createState() =>
      _BuiltinExplictAnimationDemoState();
}

class _BuiltinExplictAnimationDemoState
    extends State<BuiltinExplictAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            // 1st child
            Align(
              alignment: Alignment.bottomLeft,
              child: TimeStopper(
                controller: _animationController,
              ),
            ),

            // 2nd child
            Align(
              alignment: Alignment.center,
              child: RotationTransition(
                child: GalaxyFitz(),
                alignment: Alignment.center,
                turns: _animationController,
              ),
            ),
          ],
        ));
  }
}

class GalaxyFitz extends StatelessWidget {
  const GalaxyFitz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network('https://miro.medium.com/max/1400/0*1xmX3Sfp_rLOAwwl');
  }
}

class TimeStopper extends StatelessWidget {
  final AnimationController controller;

  const TimeStopper({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.isAnimating) {
          controller.stop();
        } else {
          controller.repeat();
        }
      },
      child: Container(
        height: 100,
        width: 100,
        color: Colors.red,
      ),
    );
  }
}



// class should be stateful
// init state
// dispose state
// add 'with SingleTickerProviderStateMixin' in the state of your widget
// initialize our animation controller


