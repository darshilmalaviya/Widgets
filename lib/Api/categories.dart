import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'categori_wise_product.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key, this.categories}) : super(key: key);
  final categories;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Future getUser() async {
    var data;
    http.Response response =
        await http.get(Uri.parse('https://dummyjson.com/products/categories/'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print("RESPONSE ${data}");
    } else {
      print('STATUS ${response.statusCode}');
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoriesWiseProduct(
                                    categories: snapshot.data[index]),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Center(
                          child: Text(
                            "${snapshot.data![index]}",
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
