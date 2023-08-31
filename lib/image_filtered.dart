import 'dart:ui';

import 'package:flutter/material.dart';

class ImageFilteredDemo extends StatefulWidget {
  const ImageFilteredDemo({Key? key}) : super(key: key);

  @override
  State<ImageFilteredDemo> createState() => _ImageFilteredDemoState();
}

class _ImageFilteredDemoState extends State<ImageFilteredDemo> {
  double sigmax = 0;
  double sigmay = 0;
  double rotation = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: sigmax, sigmaY: sigmay),
            child: Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                "https://images.unsplash.com/photo-1679506046887-0741ba2ec606?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
                fit: BoxFit.cover,
              ),
            ),
          ),
          ImageFiltered(
            imageFilter: ImageFilter.matrix(Matrix4.skewY(rotation).storage),
            child: Text(
              "hello Codeline",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Slider(
            min: 0,
            max: 5,
            value: sigmax,
            onChanged: (value) {
              setState(() {
                sigmax = value;
              });
            },
          ),
          Slider(
            min: 0,
            max: 5,
            value: sigmay,
            onChanged: (value) {
              setState(() {
                sigmay = value;
              });
            },
          ),
          Slider(
            min: 0,
            max: 10,
            value: rotation,
            onChanged: (value) {
              setState(() {
                rotation = value;
              });
            },
          ),
          Text("$rotation")
        ],
      ),
    );
  }
}
