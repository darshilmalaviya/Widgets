import 'package:flutter/material.dart';

class TextFieldDemo extends StatelessWidget {
  const TextFieldDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.keyboard_backspace_outlined,
                size: 50,
                color: Colors.red,
              ),
              SizedBox(height: 20),
              TextField(
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                // textAlign: TextAlign.center,
                // obscureText: true,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.newline,
                // textDirection: TextDirection.rtl,
                maxLines: 1,
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: "",
                  // fillColor: Colors.red, filled: true,
                  // label: Icon(Icons.remove),
                  prefix: Icon(Icons.menu),

                  constraints: BoxConstraints(
                      maxWidth: 300,
                      minWidth: 200,
                      maxHeight: 60,
                      minHeight: 60),
                  alignLabelWithHint: true,
                  icon: Icon(Icons.person_outline),
                  suffixIcon: Icon(Icons.visibility),
                  // hintText: "Name",
                  labelText: "Name", labelStyle: TextStyle(color: Colors.green),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    // borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.red),
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                ),
              ),
              TextField(
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                // textAlign: TextAlign.center,
                // obscureText: true,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                // textDirection: TextDirection.rtl,
                // maxLines: 2,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.visibility),
                  // hintText: "Name",
                  labelText: "Name", labelStyle: TextStyle(color: Colors.green),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.red),
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                ),
              ),
              // Divider(
              //   height: 10,
              //   indent: 30,
              //   endIndent: 50,
              //   color: Colors.red,
              //   thickness: 3,
              // )

              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/boysonbooks.png"),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
