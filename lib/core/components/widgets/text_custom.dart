import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final Color? backgroundColor;
  final TextDecoration? decoration;
  final bool? softWrap;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const TextCustom(
      {required this.text,
      this.fontSize = 14,
      this.fontWeight,
      this.color = Colors.black,
      super.key,
      this.backgroundColor,
      this.decoration,
      this.softWrap,
      this.textAlign,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      softWrap: softWrap,
      text,
      style: TextStyle(
        overflow: overflow,
        decoration: decoration,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
