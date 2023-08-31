import 'package:flutter/material.dart';

class ConstrantBoxDemo extends StatefulWidget {
  const ConstrantBoxDemo({Key? key}) : super(key: key);

  @override
  State<ConstrantBoxDemo> createState() => _ConstrantBoxDemoState();
}

class _ConstrantBoxDemoState extends State<ConstrantBoxDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: 400, minHeight: 200, maxWidth: 300, minWidth: 150),
          child: Container(
            height: 600,
            width: 400,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
