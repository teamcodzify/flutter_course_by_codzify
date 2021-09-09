import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const owl_url =
    'https://raw.githubusercontent.com/flutter/website/master/src/images/owl.jpg';

class FadeInDemo extends StatefulWidget {
  _FadeInDemoState createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  double opacityLevel = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Image.network(owl_url),
          TextButton(
            child: const Text(
              'Show details',
              style: TextStyle(color: Colors.blueAccent),
            ),
            onPressed: () => setState(() {
              opacityLevel = 1.0;
            }),
          ),
          AnimatedOpacity(
            duration: Duration(seconds: 3),
            curve: Curves.easeInOutSine,
            opacity: opacityLevel,
            child: Column(
              children: <Widget>[
                Text('Type: Owl'),
                Text('Age: 39'),
                Text('Employment: None'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
