import 'package:flutter/material.dart';

class SliverAppBarDemo extends StatefulWidget {
  const SliverAppBarDemo({Key? key}) : super(key: key);

  @override
  State<SliverAppBarDemo> createState() => _SliverAppBarDemoState();
}

class _SliverAppBarDemoState extends State<SliverAppBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.teal,
            pinned: true,
            // collapsedHeight: 100,
            // toolbarHeight: 80,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Sliver App Bar"),
              centerTitle: true,
              background: Image.network(
                "https://images.unsplash.com/photo-1679506046887-0741ba2ec606?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  height: 500,
                  width: double.infinity,
                  color: Colors.red,
                ),
                Container(
                  height: 500,
                  width: double.infinity,
                  color: Colors.green,
                ),
                Container(
                  height: 500,
                  width: double.infinity,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
