import 'package:flutter/material.dart';

class DraggbleScrollableDemo extends StatefulWidget {
  const DraggbleScrollableDemo({Key? key}) : super(key: key);

  @override
  State<DraggbleScrollableDemo> createState() => _DraggbleScrollableDemoState();
}

class _DraggbleScrollableDemoState extends State<DraggbleScrollableDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1680237659901-29f8d39ff290?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
          ),
          DraggableScrollableSheet(
            maxChildSize: 1,
            minChildSize: 0.1,
            snap: true,
            snapSizes: [0.3, 0.5],
            builder: (context, scrollController) {
              return ListView.builder(
                controller: scrollController,
                physics: BouncingScrollPhysics(),
                itemCount: 25,
                itemBuilder: (context, index) {
                  return Container(
                    height: 30,
                    width: 360,
                    color: Colors.blue.withOpacity(0.2),
                    margin: EdgeInsets.only(top: 10),
                    child: Center(
                      child: Text("Index $index"),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
