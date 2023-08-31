import 'package:flutter/material.dart';

class DismissibleDemo extends StatefulWidget {
  const DismissibleDemo({Key? key}) : super(key: key);

  @override
  State<DismissibleDemo> createState() => _DismissibleDemoState();
}

class _DismissibleDemoState extends State<DismissibleDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: List.generate(
            12,
            (index) => Dismissible(
              key: UniqueKey(),
              background: Icon(Icons.delete),
              secondaryBackground: Icon(Icons.share),
              crossAxisEndOffset: -10,
              child: Container(
                height: 30,
                width: double.infinity,
                color: Colors.blue.withOpacity(0.3),
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Center(
                  child: Text("Index $index"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
