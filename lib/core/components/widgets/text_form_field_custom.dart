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
  final bool? obscureText;
  final void Function(String)? onFieldSubmitted;
  final bool enabled;
  final InputBorder? errorBorder;
  final TextDirection? hintTextDirection;
  final InputBorder? enabledBorder;
  InputBorder? disabledBorder;
  InputBorder? focusedBorder;

  CustomTextFormField(
      {this.controller,
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
      String? obscuringCharacter,
      this.obscureText,
      this.onFieldSubmitted,
      this.errorBorder,
      this.hintTextDirection,
      this.enabled = true,
      this.enabledBorder,
      this.disabledBorder,
      this.focusedBorder});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onFieldSubmitted: onFieldSubmitted,
      obscuringCharacter: '*',
      obscureText: obscureText ?? false,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
          focusedBorder: focusedBorder,
          disabledBorder: disabledBorder,
          enabledBorder: enabledBorder,
          errorBorder: errorBorder,
          hintTextDirection: hintTextDirection,
          enabled: enabled,
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
