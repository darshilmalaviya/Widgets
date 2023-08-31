import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController textEditingController = TextEditingController();

  bool loading = false;
  var data;

  Future getData() async {
    setState(() {
      loading = true;
    });
    http.Response response = await http.get(
      Uri.parse(
          'https://dummyjson.com/products/search?q=${textEditingController.text}'),
    );
    try {
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        print("RESPONSE $data");
        setState(() {
          loading = false;
        });
      } else {
        print('STATUS ${response.statusCode}');
        setState(
          () {
            loading = false;
          },
        );
      }
    } catch (e) {
      print('ERROR $e');
      setState(() {
        loading = false;
      });
    }
  }

  Future addPost() async {
    setState(() {
      loading = true;
    });
    http.Response response = await http.post(
      Uri.parse(
        'https://fakestoreapi.com/products',
      ),
      body: {
        "title": 'test product',
        "price": '13.5',
        "description": 'lorem ipsum set',
        "image": 'https://i.pravatar.cc',
        "category": 'electronic'
      },
    );
    try {
      if (response.statusCode == 200) {
        print("RESPONSE ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product added successfully')));
        setState(() {
          loading = false;
        });
      } else {
        print('STATUS ${response.statusCode}');
        setState(
          () {
            loading = false;
          },
        );
      }
    } catch (e) {
      print('ERROR $e');
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addPost();
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: TextField(
                  controller: textEditingController,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    if (value == '') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Please enter keywords')));
                    } else {
                      getData();
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                    hintText: "Search product",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              loading
                  ? const Center(child: CircularProgressIndicator())
                  : data == null
                      ? const Center(child: Text("NoData"))
                      : data["total"] == 0
                          ? const Center(child: Text("No Products Found"))
                          : SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: SizedBox(
                                height: 800,
                                width: 392,
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: data["products"].length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 0.8,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        Container(
                                          height: 150,
                                          width: 150,
                                          child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              data!["products"][index]
                                                  ["thumbnail"],
                                            ),
                                          ),
                                        ),
                                        Text(
                                            "${data["products"][index]["title"]}"),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
            ],
          ),
        ),
      ),
    );
  }
}
