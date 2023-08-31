import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:widgest/Model/Request/add_product_request_model.dart';

class UploadPost extends StatefulWidget {
  const UploadPost({Key? key}) : super(key: key);

  @override
  State<UploadPost> createState() => _UploadPostState();
}

class _UploadPostState extends State<UploadPost> {
  AddProductReq addProductReq = AddProductReq();

  Map<String, dynamic> body = {
    "userId": "1",
    "title": "qui est esse",
    "body": "Darshil",
  };

  bool loading = false;

  Future<Map> getCategories() async {
    setState(() {
      loading = true;
    });

    addProductReq.userId = "1";
    addProductReq.title = "ertyuiop";
    addProductReq.body = "ddvdsvdvdvdsd";

    http.Response response = await http.delete(
      Uri.parse("https://fakestoreapi.com/products/1"),
      body: addProductReq.toJson(),
      // headers: {
      //   'Content-type': 'application/json; charset=UTF-8',
      //   'Authorization': 'Bearer ey',
      // },
    );
    Map categories = {};

    try {
      if (response.statusCode == 200) {
        categories = jsonDecode(response.body);
        setState(() {
          loading = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Delete success')));
        // print("RESPONS${categories}");
      } else {
        print("STATUS ${response.statusCode}");
        setState(() {
          loading = false;
        });
      }
    } catch (e) {
      print("ERROR $e}");
      setState(() {
        loading = false;
      });
    }
    return categories;
  }

  // Post Api Integration

  postdata() async {
    var responce = await http.post(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      body: {
        "dfgfb": "fdfdbg",
        "Name": "Darshil",
        "Surname": "Malaviya",
      },
    );
    print(responce.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Column(
                  children: [
                    MaterialButton(
                      color: Colors.blue,
                      height: 60,
                      minWidth: double.infinity,
                      onPressed: () async {
                        var data = await getCategories();
                        print('RESPONSE RETURNED${data}');
                      },
                      child: const Text('Delete post'),
                    ),

                    // Post Api Button
                    ElevatedButton(
                      onPressed: () {
                        postdata();
                      },
                      child: Text("Post"),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
