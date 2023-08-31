import 'package:flutter/material.dart';

class ReoderableListDemo extends StatefulWidget {
  const ReoderableListDemo({Key? key}) : super(key: key);

  @override
  State<ReoderableListDemo> createState() => _ReoderableListDemoState();
}

class _ReoderableListDemoState extends State<ReoderableListDemo> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ReorderableListView(
          key: UniqueKey(),
          children: List.generate(
            name.length,
            (index) => Container(
              key: UniqueKey(),
              height: 30,
              width: 392,
              color: Colors.red.withOpacity(0.2),
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Center(
                child: Text("Name ${name[index]}"),
              ),
            ),
          ),
          onReorder: (oldIndex, newIndex) {
            setState(() {});
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            var olditem = name.removeAt(oldIndex);
            name.insert(newIndex, olditem);
          },
        ),
      ),
    );
  }
}
