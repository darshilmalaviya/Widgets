import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:widgest/Api/single_product.dart';

class CategoriesWiseProduct extends StatefulWidget {
  const CategoriesWiseProduct({Key? key, this.categories}) : super(key: key);
  final categories;

  @override
  State<CategoriesWiseProduct> createState() => _CategoriesWiseProductState();
}

class _CategoriesWiseProductState extends State<CategoriesWiseProduct> {
  Future getUser() async {
    var data;
    http.Response response = await http.get(Uri.parse(
        'https://dummyjson.com/products/category/${widget.categories}'));

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
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2.8 / 3.5,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DataScreen2(
                              products: snapshot.data!["products"][index]["id"],
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 8,
                            child: Container(
                              width: double.infinity,
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  snapshot.data!["products"][index]
                                      ["thumbnail"],
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "price ${snapshot.data!["products"][index]["price"]}",
                          ),
                          Text(
                            snapshot.data!["products"][index]["title"],
                          ),
                        ],
                      ),
                    );
                  },
                ),
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
