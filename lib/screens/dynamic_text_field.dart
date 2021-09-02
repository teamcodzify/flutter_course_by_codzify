import 'package:flutter/material.dart';

class DynamicTextField extends StatefulWidget {
  @override
  State<DynamicTextField> createState() => _DynamicTextFieldState();
}

class _DynamicTextFieldState extends State<DynamicTextField> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  String dropDownValue = "value 1";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
          child: Column(
        children: [
          TextFormField(
            controller: _firstNameController,
            decoration: const InputDecoration(hintText: "First Name"),
          ),
          TextFormField(
            controller: _lastNameController,
            decoration: const InputDecoration(hintText: "Last Name"),
          ),
          DropdownButton(
            value: dropDownValue,
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              const DropdownMenuItem(value: "value 1", child: Text("value 1")),
              const DropdownMenuItem(value: "value 2", child: Text("value 2")),
              const DropdownMenuItem(value: "value 3", child: Text("value 3"))
            ],
            onChanged: (value) {
              setState(() {
                dropDownValue = value.toString();
              });
            },
          ),
        ],
      )),
    );
  }
}
