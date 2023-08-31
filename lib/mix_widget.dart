import 'package:flutter/material.dart';

import 'Stack.dart';

class MixWidget extends StatelessWidget {
  const MixWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Center(
          //   child: Container(
          //     height: 200,
          //     width: 200,
          //     color: Colors.red,
          //   ),
          // ),
          // SizedBox(
          //   height: 30,
          // ),
          // Center(
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => StackDemo(),
                ),
              );
            },
            child: Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
          ),
          // ),
          // Spacer(),
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
