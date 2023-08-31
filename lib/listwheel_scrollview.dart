import 'package:flutter/material.dart';

class ListWheelScrollViewDemo extends StatefulWidget {
  const ListWheelScrollViewDemo({Key? key}) : super(key: key);

  @override
  State<ListWheelScrollViewDemo> createState() =>
      _ListWheelScrollViewDemoState();
}

class _ListWheelScrollViewDemoState extends State<ListWheelScrollViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListWheelScrollView(
        diameterRatio: 0.8,
        perspective: 0.01,
        overAndUnderCenterOpacity: 0.2,
        offAxisFraction: 0.0,
        children: List.generate(
          20,
          (index) => Text("Index $index"),
        ),
        itemExtent: 70,
      ),
    );
  }
}
