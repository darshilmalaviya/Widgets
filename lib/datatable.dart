import 'package:flutter/material.dart';

class DataTableDemo extends StatefulWidget {
  const DataTableDemo({Key? key}) : super(key: key);

  @override
  State<DataTableDemo> createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  List<Map<String, dynamic>> data = [
    {
      "no": 1,
      "Name": "Darshil",
      "Surname": "Malaviya",
      "Age": 18,
      "gender": "Male",
      "City": "Surat",
    },
    {
      "no": 2,
      "Name": "Darshil",
      "Surname": "Malaviya",
      "Age": 18,
      "gender": "Male",
      "City": "Surat",
    },
    {
      "no": 3,
      "Name": "Darshil",
      "Surname": "Malaviya",
      "Age": 18,
      "gender": "Male",
      "City": "Surat",
    },
    {
      "no": 4,
      "Name": "Darshil",
      "Surname": "Malaviya",
      "Age": 18,
      "gender": "Male",
      "City": "Surat",
    },
    {
      "no": 5,
      "Name": "Darshil",
      "Surname": "Malaviya",
      "Age": 18,
      "gender": "Male",
      "City": "Surat",
    },
    {
      "no": 6,
      "Name": "Darshil",
      "Surname": "Malaviya",
      "Age": 18,
      "gender": "Male",
      "City": "Surat",
    },
    {
      "no": 7,
      "Name": "Darshil",
      "Surname": "Malaviya",
      "Age": 18,
      "gender": "Male",
      "City": "Surat",
    },
    {
      "no": 8,
      "Name": "Darshil",
      "Surname": "Malaviya",
      "Age": 18,
      "gender": "Male",
      "City": "Surat",
    },
    {
      "no": 9,
      "Name": "Darshil",
      "Surname": "Malaviya",
      "Age": 18,
      "gender": "Male",
      "City": "Surat",
    },
    {
      "no": 10,
      "Name": "Darshil",
      "Surname": "Malaviya",
      "Age": 18,
      "gender": "Male",
      "City": "Surat",
    },
    {
      "no": 11,
      "Name": "Darshil",
      "Surname": "Malaviya",
      "Age": 18,
      "gender": "Male",
      "City": "Surat",
    },
    {
      "no": 12,
      "Name": "Darshil",
      "Surname": "Malaviya",
      "Age": 18,
      "gender": "Male",
      "City": "Surat",
    },
    {
      "no": 13,
      "Name": "Darshil",
      "Surname": "Malaviya",
      "Age": 18,
      "gender": "Male",
      "City": "Surat",
    },
    {
      "no": 14,
      "Name": "Darshil",
      "Surname": "Malaviya",
      "Age": 18,
      "gender": "Male",
      "City": "Surat",
    },
    {
      "no": 15,
      "Name": "Darshil",
      "Surname": "Malaviya",
      "Age": 18,
      "gender": "Male",
      "City": "Surat",
    },
    {
      "no": 16,
      "Name": "Darshil",
      "Surname": "Malaviya",
      "Age": 18,
      "gender": "Male",
      "City": "Surat",
    },
    {
      "no": 17,
      "Name": "Darshil",
      "Surname": "Malaviya",
      "Age": 18,
      "gender": "Male",
      "City": "Surat",
    },
    {
      "no": 18,
      "Name": "Darshil",
      "Surname": "Malaviya",
      "Age": 18,
      "gender": "Male",
      "City": "Surat",
    },
    {
      "no": 19,
      "Name": "Darshil",
      "Surname": "Malaviya",
      "Age": 18,
      "gender": "Male",
      "City": "Surat",
    },
  ];
  @override
  Widget build(BuildContext context) {
    var datalength = data.first.keys.toList();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: List.generate(
                datalength.length,
                (index) => DataColumn(
                  label: Text("${datalength[index]}"),
                ),
              ),
              rows: List.generate(
                data.length,
                (index) => DataRow(
                  cells: List.generate(
                    datalength.length,
                    (index1) => DataCell(
                      Text("${data[index]["${datalength[index1]}"]}"),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
