import 'package:flutter/material.dart';

class TextGradientDemo extends StatefulWidget {
  const TextGradientDemo({Key? key}) : super(key: key);

  @override
  State<TextGradientDemo> createState() => _TextGradientDemoState();
}

class _TextGradientDemoState extends State<TextGradientDemo> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Codeline",
            style: TextStyle(
              fontSize: width * 0.29,
              foreground: Paint()
                ..shader = LinearGradient(
                        colors: [Colors.red, Colors.green, Colors.blue])
                    .createShader(
                  Rect.fromLTRB(60, 50, 350, 50),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
