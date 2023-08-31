import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              child: Icon(Icons.message),
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1571175351803-9b6b9cadb980?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c3Vuc2V0JTIwcml2ZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
              radius: 30,
              backgroundColor: Colors.red,
            ),
          ),
          MaterialButton(
            // focusElevation: 10,
            splashColor: Colors.green,
            elevation: 20,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            height: 50,
            minWidth: 200,
            color: Colors.indigo,
            onPressed: () {},
            child: Text(
              "Log in",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.indigo),
            ),
            child: Text("Press Here"),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text("Press"),
          ),
          TextButton(onPressed: () {}, child: Text("Click")),
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          SizedBox(height: 20),
          InkWell(
            onTap: () {},
            child: Icon(Icons.arrow_back),
          ),
          SizedBox(height: 20),
          InkResponse(
            onTap: () {},
            child: Icon(Icons.remove),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}
