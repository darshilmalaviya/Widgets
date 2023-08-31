import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField(
      {Key? key, this.hint, this.prefix, this.sufix, required this.obsecure})
      : super(key: key);

  final hint;
  final prefix;
  final sufix;
  final obsecure;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obsecure,
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: widget.prefix,
        suffixIcon: widget.sufix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
