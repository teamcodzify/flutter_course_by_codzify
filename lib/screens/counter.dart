import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/counter_service.dart';
import 'package:provider/provider.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    var counterService = Provider.of<CounterService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("State Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You have clicked button"),
            Text("${counterService.counter} times"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterService.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
