import 'package:flutter/material.dart';

class DateRangePickerDemo extends StatefulWidget {
  const DateRangePickerDemo({Key? key}) : super(key: key);

  @override
  State<DateRangePickerDemo> createState() => _DateRangePickerDemoState();
}

class _DateRangePickerDemoState extends State<DateRangePickerDemo> {
  var time;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDateRangePicker(
            context: context,
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          ).then((value) {
            time = value!.duration.inDays;
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text("$time"),
      ),
    );
  }
}
