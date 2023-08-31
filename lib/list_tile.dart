import 'package:flutter/material.dart';

class ListTileDemo extends StatefulWidget {
  const ListTileDemo({Key? key}) : super(key: key);

  @override
  State<ListTileDemo> createState() => _ListTileDemoState();
}

class _ListTileDemoState extends State<ListTileDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            horizontalTitleGap: 50,
            minLeadingWidth: 40,
            iconColor: Colors.red,
            textColor: Colors.green,
            leading: CircleAvatar(),
            title: Text("My Widget"),
            subtitle: Text("hello"),
            trailing: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
