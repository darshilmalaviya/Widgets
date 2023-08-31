import 'package:flutter/material.dart';

class RotatedBoxDemo extends StatelessWidget {
  const RotatedBoxDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BreakFast"),
                SizedBox(
                  width: 30,
                ),
                Text("Lunch"),
                SizedBox(
                  width: 30,
                ),
                Text("Dinner"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
