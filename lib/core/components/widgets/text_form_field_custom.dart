import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Widget? label;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final Color? filledColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final InputBorder? border;
  final bool obscureText;
  final void Function(String)? onFieldSubmitted;

  const CustomTextFormField({
    this.controller,
    this.validator,
    this.label,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.onTap,
    this.filledColor,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    super.key,
    this.hintTextStyle,
    this.labelTextStyle,
    this.border,
    required String obscuringCharacter,
    required this.obscureText,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onFieldSubmitted: onFieldSubmitted,
      obscuringCharacter: '*',
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          label: label,
          filled: filledColor != null,
          fillColor: filledColor,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle: hintTextStyle,
          labelStyle: labelTextStyle,
          border: border),
    );
  }
}
