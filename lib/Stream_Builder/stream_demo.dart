import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatefulWidget {
  const StreamDemo({Key? key}) : super(key: key);

  @override
  State<StreamDemo> createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
  StreamController<int> counter = StreamController();
  int data = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              data++;
              counter.sink.add(data);
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: counter.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text("${data}"),
            );
          } else {
            return Center(
              child: Text("${data}"),
            );
          }
        },
      ),
    );
  }
}
