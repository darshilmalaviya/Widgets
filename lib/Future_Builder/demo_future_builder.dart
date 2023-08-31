import 'package:flutter/material.dart';

class DemoFutureBuilder extends StatefulWidget {
  const DemoFutureBuilder({Key? key}) : super(key: key);

  @override
  State<DemoFutureBuilder> createState() => _DemoFutureBuilderState();
}

class _DemoFutureBuilderState extends State<DemoFutureBuilder> {
  List<Map<String, dynamic>> data = [
    {"Firstname": "Darshil", "Latsname": "Malaviya", "Age": 17},
    {"Firstname": "Darshil", "Latsname": "Malaviya", "Age": 17},
    {"Firstname": "Darshil", "Latsname": "Malaviya", "Age": 17},
  ];

  Future<int> getData() async {
    print("Hello");
    await Future.delayed(Duration(seconds: 3));
    print("Hello Codeline");

    return 10;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Text("${snapshot.data}"),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Something wan't wrong"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
