import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchDemo extends StatefulWidget {
  const SearchDemo({Key? key}) : super(key: key);

  @override
  State<SearchDemo> createState() => _SearchDemoState();
}

class _SearchDemoState extends State<SearchDemo> {
  List name = [
    "Darshil",
    "Dhruv",
    "Mahesh",
    "Jenis",
    "Nevil",
    "Avi",
    "Harsh",
    "Brijesh",
    "Priyank",
    "Dhruvin",
    "Jemin",
  ];
  List adddata = [];
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  adddata.clear();
                });
                name.forEach(
                  (element) {
                    if (element.contains(value)) {
                      adddata.add(element);
                    }
                  },
                );
              },
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Name",
              ),
            ),
            nameController.text == ""
                ? ListView.builder(
                    itemCount: name.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Text("${name[index]}");
                    },
                  )
                : ListView.builder(
                    itemCount: adddata.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Text("${adddata[index]}");
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
