import 'package:flutter/material.dart';

class demo125 extends StatefulWidget {
  const demo125({Key? key}) : super(key: key);

  @override
  State<demo125> createState() => _demo125State();
}

class _demo125State extends State<demo125> {
  List<Map<String, dynamic>> data = [
    {"Firstname": "Darshil", "Latsname": "Malaviya", "Age": 17},
    {"Firstname": "Darshil", "Latsname": "Malaviya", "Age": 17},
    {"Firstname": "Darshil", "Latsname": "Malaviya", "Age": 17},
  ];

  Future<List<Map>> getData() async {
    print("Hello");
    await Future.delayed(Duration(seconds: 10));
    print("Hello Codeline");

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Text(
                "${snapshot.data![2]["Firstname"]}",
                style: TextStyle(fontSize: 20),
              ),
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
