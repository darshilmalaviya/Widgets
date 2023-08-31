import 'package:flutter/material.dart';

class DropDownButtonDemo extends StatefulWidget {
  const DropDownButtonDemo({Key? key}) : super(key: key);

  @override
  State<DropDownButtonDemo> createState() => _DropDownButtonDemoState();
}

class _DropDownButtonDemoState extends State<DropDownButtonDemo> {
  List name = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
  ];

  String? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                alignment: Alignment.bottomCenter,
                underline: SizedBox(),
                value: data,
                isExpanded: true,
                hint: Text("Select"),
                items: List.generate(
                  name.length,
                  (index) => DropdownMenuItem(
                    alignment: Alignment.centerLeft,
                    enabled: true,
                    value: name[index],
                    child: Text("${name[index]}"),
                  ),
                ),
                onChanged: (value) {
                  setState(
                    () {
                      data = value as String?;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
