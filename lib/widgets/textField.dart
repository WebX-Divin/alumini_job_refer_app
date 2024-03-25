// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final IconData? iconData;
  final String? hintText;
  final bool? isVisible;
  final bool? isEnabled;

  const CustomTextField({
    Key? key,
    this.textEditingController,
    this.iconData,
    this.hintText,
    this.isEnabled = true,
    this.isVisible = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        enabled: widget.isEnabled,
        controller: widget.textEditingController,
        obscureText: widget.isVisible!,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              widget.iconData,
              color: Colors.purple,
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            )),
      ),
    );
  }
}
