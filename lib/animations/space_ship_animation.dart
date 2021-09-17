import 'package:flutter/material.dart';

class SpaceShipAnimation extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SpaceShipAnimation>
    with SingleTickerProviderStateMixin {
  final Image starsBackground = Image.network(
    'https://images.unsplash.com/photo-1537420327992-d6e192287183?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80',
  );
  final Image ufo = Image.network(
      'https://images.unsplash.com/photo-1537420327992-d6e192287183?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80');
  late AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        // starsBackground,
        BeamTransition(animation: _animation),
        // ufo,
      ],
    );
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }
}

class BeamTransition extends AnimatedWidget {
  BeamTransition({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Listenable animation = listenable;
    return ClipPath(
      clipper: const BeamClipper(),
      child: Container(
        height: 1000,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 1.5,
            colors: [
              Colors.yellow,
              Colors.transparent,
            ],
            // stops: [0, animation.value],
            stops: [0, 1],
          ),
        ),
      ),
    );
  }
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
