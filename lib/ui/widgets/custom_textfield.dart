import "package:flutter/material.dart";


class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final int? minLines;
  final int? maxLines;
  const CustomTextField({
    Key? key,
    required this.controller,
    this.minLines,
    this.obscureText = false,
    this.maxLines,
    this.hintText,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: widget.maxLines ?? 1,
      minLines: widget.minLines ?? 1,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.grey
        ),
        border: const UnderlineInputBorder()
      ),
    );
  }
}
