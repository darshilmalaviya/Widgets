import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataScreen2 extends StatefulWidget {
  const DataScreen2({Key? key, this.products}) : super(key: key);
  final products;
  @override
  State<DataScreen2> createState() => _DataScreen2State();
}

class _DataScreen2State extends State<DataScreen2> {
  Future<Map> getUser() async {
    http.Response response = await http
        .get(Uri.parse('https://dummyjson.com/products/${widget.products}'));

    Map users = {};

    try {
      if (response.statusCode == 200) {
        users = jsonDecode(response.body);
        print('RESPONSE ${users}');
        print('${widget.products}');
      } else {
        print('STATUS ${response.statusCode}');
      }
    } catch (e) {
      print('ERROR $e');
    }
    return users;
  }

  int select = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 400,
                      child: PageView.builder(
                        itemCount: snapshot.data!["images"].length,
                        onPageChanged: (value) {
                          select = value;
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  snapshot.data!["images"][index],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Text("title :${snapshot.data!["title"]}"),
                    Text("description :${snapshot.data!["description"]}"),
                    Text("price :${snapshot.data!["price"]}"),
                    Text(
                        "discountPercentage :${snapshot.data!["discountPercentage"]}"),
                    Text("rating :${snapshot.data!["rating"]}"),
                    Text("stock :${snapshot.data!["stock"]}"),
                    Text("brand :${snapshot.data!["brand"]}"),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
