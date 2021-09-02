import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DynamicDropDown extends StatefulWidget {
  const DynamicDropDown({Key? key}) : super(key: key);

  @override
  State<DynamicDropDown> createState() => _DynamicDropDownState();
}

class _DynamicDropDownState extends State<DynamicDropDown> {
  String dropDownValue1 = "Stock 1";
  String dropDownValue2 = "value 1";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
          child: Column(
        children: [
          // First drop down
          StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("stocks").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: Text("Loading"));
                } else {
                  List<DropdownMenuItem<String>> stocks = [];
                  List<int> quantity = [];

                  for (int i = 0; i < snapshot.data!.docs.length; i++) {
                    Map<String, dynamic> data =
                        snapshot.data!.docs[i].data() as Map<String, dynamic>;

                    stocks.add(
                      DropdownMenuItem(
                        value: data["name"],
                        child: Text(data["name"]),
                      ),
                    );

                    quantity.add(5);
                    // quantity.add(int.parse(data["qty"]));
                  }

                  return DropdownButton(
                    value: dropDownValue1,
                    items: stocks,
                    onChanged: (_value) {
                      setState(() {
                        dropDownValue1 = _value.toString();
                      });
                    },
                  );
                }
              }),

          // second drop down
          DropdownButton(
            value: dropDownValue2,
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              const DropdownMenuItem(value: "value 1", child: Text("value 1")),
              const DropdownMenuItem(value: "value 2", child: Text("value 2")),
              const DropdownMenuItem(value: "value 3", child: Text("value 3"))
            ],
            onChanged: (value) {
              setState(() {
                dropDownValue2 = value.toString();
              });
            },
          ),
        ],
      )),
    );
  }
}
