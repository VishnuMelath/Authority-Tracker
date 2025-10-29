import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const CustomTextfield({
    super.key,
    this.controller,
    required this.hintText,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.grey.withAlpha(120)),
    );
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 14),
      cursorColor: Colors.black,
      cursorHeight: 20,
      cursorWidth: 1.5,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey.withAlpha(150)),
        isCollapsed: true,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }
}
