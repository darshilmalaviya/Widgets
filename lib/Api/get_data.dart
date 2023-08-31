import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetData extends StatefulWidget {
  const GetData({Key? key}) : super(key: key);

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  var data;
  bool loading = false;

  @override
  void initState() {
    getUser();
    // TODO: implement initState
    super.initState();
  }

  Future getUser() async {
    setState(() {
      loading = true;
    });

    http.Response response = await http
        .get(Uri.parse('https://dummyjson.com/products/search?q=Laptop'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print("RESPONSE ${data}");
      setState(() {
        loading = false;
      });
    } else {
      print('STATUS ${response.statusCode}');
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: List.generate(
                20,
                (index) => Text('${data[index]}'),
              ),
            ),
    );
  }
}
