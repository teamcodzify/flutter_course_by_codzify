import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DynamicDropDown extends StatefulWidget {
  const DynamicDropDown({Key? key}) : super(key: key);

  @override
  State<DynamicDropDown> createState() => _DynamicDropDownState();
}

class _DynamicDropDownState extends State<DynamicDropDown> {
  String dropDownValue1 = "Stock 1";
  int dropDownValue2 = 1;
  int length = 1;
  Map<String, int> allData = {};

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

                  for (int i = 0; i < snapshot.data!.docs.length; i++) {
                    Map<String, dynamic> data =
                        snapshot.data!.docs[i].data() as Map<String, dynamic>;

                    stocks.add(
                      DropdownMenuItem(
                        value: data["name"],
                        child: Text(data["name"]),
                      ),
                    );

                    allData[data["name"]] = data["qty"];
                  }

                  return Column(
                    children: [
                      // first drop down
                      DropdownButton(
                        value: dropDownValue1,
                        items: stocks,
                        onChanged: (_value) {
                          setState(
                            () {
                              length = allData[_value]!;
                              dropDownValue1 = _value.toString();
                            },
                          );
                        },
                      ),

                      // second drop down
                      DropdownButton(
                        value: dropDownValue2,
                        items: List.generate(
                          length,
                          (index) {
                            return DropdownMenuItem(
                              value: index + 1,
                              child: Text(
                                "${index + 1}",
                              ),
                            );
                          },
                        ),
                        onChanged: (_value) {
                          setState(() {
                            dropDownValue2 = int.parse(
                              _value.toString(),
                            );
                          });
                        },
                      ),
                    ],
                  );
                }
              }),
        ],
      )),
    );
  }
}
