import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/dynamic_dropdown.dart';
import 'package:flutter_ecommerce_app/screens/dynamic_text_field.dart';

class DynamicWidgetsPage extends StatefulWidget {
  const DynamicWidgetsPage({Key? key}) : super(key: key);

  @override
  _DynamicWidgetsPageState createState() => _DynamicWidgetsPageState();
}

class _DynamicWidgetsPageState extends State<DynamicWidgetsPage> {
  List<DynamicDropDown> dynamicWidgets = [];

  printData() {
    // dynamicWidgets.forEach((element) {
    //   print(element.toString());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: dynamicWidgets.length,
                itemBuilder: (context, index) {
                  return dynamicWidgets[index];
                },
              ),
            ),
            ElevatedButton(
              onPressed: printData,
              child: const Text("Submit Data"),
            ),
          ],
        ),
        floatingActionButton: Container(
          height: 100,
          width: 50,
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              IconButton(
                onPressed: () {
                  setState(() {
                    dynamicWidgets.add(DynamicDropDown());
                  });
                },
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    dynamicWidgets.removeLast();
                  });
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
        ));
  }
}
