import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Alignment _alignment = Alignment.centerRight;
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            setState(
              () {
                _alignment = _alignment == Alignment.topLeft
                    ? Alignment.bottomRight
                    : Alignment.topLeft;
              },
            );
          },
          child: TweenAnimationBuilder(
            tween: AlignmentTween(begin: Alignment.topLeft, end: _alignment),
            duration: Duration(seconds: 1),
            builder:
                (BuildContext context, Alignment alignment, Widget? child) {
              return Align(
                alignment: alignment,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
