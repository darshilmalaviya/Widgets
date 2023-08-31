import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerDemo extends StatefulWidget {
  const DatePickerDemo({Key? key}) : super(key: key);

  @override
  State<DatePickerDemo> createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  DateTime initialDate = DateTime.now();
  DateTime currentDate = DateTime.now();
  DateFormat formate = DateFormat("dd / MM / yyyy");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          currentDate = (await showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          ))!;
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text("${formate.format(currentDate)}"),
      ),
    );
  }
}
