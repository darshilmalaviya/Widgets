import 'dart:async';
import 'package:flutter/material.dart';

class StreamBuilderDemo_2 extends StatefulWidget {
  const StreamBuilderDemo_2({Key? key}) : super(key: key);

  @override
  State<StreamBuilderDemo_2> createState() => _StreamBuilderDemo_2State();
}

class _StreamBuilderDemo_2State extends State<StreamBuilderDemo_2> {
  StreamController<List<String>> counter = StreamController();
  TextEditingController Name = TextEditingController();
  List<String> Add = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              Add.add(Name.text);
              counter.sink.add(Add);
              Name.clear();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: Name,
              decoration: const InputDecoration(
                labelText: "Enter value",
              ),
            ),
            StreamBuilder(
              stream: counter.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: Add.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Text(snapshot.data![index]);
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("Somthing wan't wrong"),
                  );
                } else {
                  return const Center(
                    child: Text(" "),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
