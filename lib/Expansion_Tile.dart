import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatefulWidget {
  const ExpansionTileDemo({Key? key}) : super(key: key);

  @override
  State<ExpansionTileDemo> createState() => _ExpansionTileDemoState();
}

class _ExpansionTileDemoState extends State<ExpansionTileDemo> {
  List name = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ExpansionTile(
            expandedAlignment: Alignment.centerLeft,
            childrenPadding: EdgeInsets.symmetric(horizontal: 30),
            // expandedCrossAxisAlignment: CrossAxisAlignment.start,
            title: Text("Select"),
            children: List.generate(
              name.length,
              (index) => Text(
                name[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
