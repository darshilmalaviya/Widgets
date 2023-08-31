import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DemoGet extends StatefulWidget {
  const DemoGet({Key? key}) : super(key: key);

  @override
  State<DemoGet> createState() => _DemoGetState();
}

class _DemoGetState extends State<DemoGet> {
  Future getData() async {
    var data;
    http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);

      print('RESPONSE ${data[0]}');
    } else {
      print('RESPONSE ${response.statusCode}');
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Text('${snapshot.data[10]['id']}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
