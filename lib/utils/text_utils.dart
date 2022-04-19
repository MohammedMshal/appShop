import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  const TextUtils({
    required this.text,
    required this.fontSize,
    this.fontWeight,
    required this.color,
    this.textDecoration,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          decoration: textDecoration,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
