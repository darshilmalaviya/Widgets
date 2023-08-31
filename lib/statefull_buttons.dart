import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  double slidervalue = 0;
  bool isswitch = false;
  bool ischeck = false;
  int select = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 10,
                  activeTickMarkColor: Colors.white,
                  inactiveTickMarkColor: Colors.red,
                  activeTrackColor: Colors.green,
                  inactiveTrackColor: Colors.grey,
                  thumbColor: Colors.white,
                  valueIndicatorColor: Colors.transparent,
                  valueIndicatorTextStyle: TextStyle(color: Colors.black),
                ),
                child: Slider.adaptive(
                  min: 0,
                  max: 100,
                  divisions: 20,
                  label: "\€${slidervalue.toStringAsFixed(1)}",
                  value: slidervalue,
                  onChanged: (value) {
                    setState(() {
                      slidervalue = value;
                    });
                  },
                )),
          ),
          Switch(
            activeTrackColor: Colors.green,
            inactiveTrackColor: Colors.red,
            thumbColor: MaterialStateProperty.all(Colors.white),
            value: isswitch,
            onChanged: (value) {
              setState(() {
                isswitch = !isswitch;
              });
            },
          ),
          Checkbox(
            activeColor: Colors.green,
            // shape:
            //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            value: ischeck,
            onChanged: (value) {
              setState(() {
                ischeck = !ischeck;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Male"),
              Radio(
                value: 1,
                groupValue: select,
                onChanged: (value) {
                  setState(() {
                    select = value!;
                  },);
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Female"),
              Radio(
                value: 2,
                groupValue: select,
                onChanged: (value) {
                  setState(() {
                    select = value!;
                  });
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
