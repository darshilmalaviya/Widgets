import 'package:flutter/material.dart';

class DemoAnimation extends StatefulWidget {
  const DemoAnimation({Key? key}) : super(key: key);

  @override
  State<DemoAnimation> createState() => _DemoAnimationState();
}

class _DemoAnimationState extends State<DemoAnimation> {
  bool big = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          big = !big;
          setState(() {});
        },
      ),
      body: Center(
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedContainer(
            //   duration: Duration(seconds: 3),
            //
            //   child: Container(
            //     height: big ? 400 : 200,
            //     width: big ? 400 : 200,
            //     color: Colors.blue,
            //   ),
            // )

            // AnimatedAlign(
            //   alignment: big ? Alignment.centerLeft : Alignment.centerRight,
            //   duration: Duration(seconds: 2),
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     color: Colors.blue,
            //   ),
            // ),

            // AnimatedCrossFade(
            //   firstChild: Container(
            //     height: 200,
            //     width: 200,
            //     color: Colors.blue,
            //   ),
            //   secondChild: CircleAvatar(radius: 65),
            //   crossFadeState:
            //       big ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            //   duration: Duration(
            //     seconds: 2,
            //   ),
            // ),

            // AnimatedScale(
            //   scale: big ? 1.0 : 2.0,
            //   duration: Duration(seconds: 2),
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     color: Colors.blue,
            //   ),
            // ),

            AnimatedRotation(
              turns: big ? 1.0 : 2.0,
              duration: const Duration(seconds: 2),
              child: Container(
                height: 200,
                width: 200,
                color: Colors.blue,
              ),
            ),

            // AnimatedPositioned(
            //   top: big ? 10 : 200,
            //   left: big ? 10 : 200,
            //   duration: Duration(seconds: 2),
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     color: Colors.blue,
            //   ),
            // ),

            // AnimatedOpacity(
            //   opacity: big ? 0 : 1,
            //   duration: Duration(seconds: 2),
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     color: Colors.blue,
            //   ),
            // ),

            // AnimatedPadding(
            //   padding: big ? EdgeInsets.all(10) : EdgeInsets.all(50),
            //   duration: Duration(seconds: 2),
            //   child: Container(
            //     height: 400,
            //     width: 400,
            //     color: Colors.blue,
            //   ),
            // ),

            // AnimatedSlide(
            //   offset: big ? Offset(-20.0, -20.0) : Offset(20, 20),
            //   duration: Duration(seconds: 2),
            //   child: Container(
            //     height: 400,
            //     width: 400,
            //     color: Colors.blue,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
