import 'package:flutter/material.dart';

class TextFormFiledAuth extends StatelessWidget {
  const TextFormFiledAuth(
      {required this.controller,
      required this.obscureText,
      required this.prefix,
      required this.validator,
      required this.hintText,
      this.suffixIcon,
      Key? key})
      : super(key: key);

  final TextEditingController controller;
  final bool obscureText;
  final Widget prefix;
  final Function validator;
  final Widget? suffixIcon;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: (value) => (validator(value)),
      decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          prefixIcon: prefix,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
              fontSize: 16, color: Colors.black45, fontWeight: FontWeight.w500),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.white)),
          filled: true,
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.white)),
              errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.white)),
              focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.red)),
          ),
    );
  }
}
