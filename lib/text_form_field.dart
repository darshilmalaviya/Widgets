import 'package:flutter/material.dart';

class TextFormFieldDemo extends StatefulWidget {
  const TextFormFieldDemo({Key? key}) : super(key: key);

  @override
  State<TextFormFieldDemo> createState() => _TextFormFieldDemoState();
}

class _TextFormFieldDemoState extends State<TextFormFieldDemo> {
  TextEditingController emailcntlr = TextEditingController();
  TextEditingController passcntlr = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String Email = "abc123@gmail.com";
  String Pass = "Abc123@123";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  bool validEmail = RegExp(
                          "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$")
                      .hasMatch(value!);

                  if (validEmail) {
                    return null;
                  } else {
                    return "Invalid email";
                  }
                },
                controller: emailcntlr,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  bool validPass = RegExp(
                          "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}\$")
                      .hasMatch(value!);

                  if (validPass) {
                    return null;
                  } else {
                    return "Invalid password";
                  }
                },
                controller: passcntlr,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 50),
              MaterialButton(
                height: 50,
                minWidth: 300,
                color: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Log In",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {});
                  if (formKey.currentState!.validate()) {
                    if (Email == emailcntlr.text && Pass == passcntlr.text) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Center(
                            child: Text("Succesfull"),
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Invalid credential"),
                        ),
                      );
                    }
                  }
                },
              ),
              Text("${emailcntlr.text}"),
            ],
          ),
        ),
      ),
    );
  }
}
