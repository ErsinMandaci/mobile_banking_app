import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.validator,
    this.prefixIcon,
    this.hintText,
    this.obscureText,
    this.controller,
    this.suffixIcon,
    this.hintStyle,
    this.prefixIconColor,
    this.suffixIconColor,
    this.onChanged,
  });
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final void Function(String)? onChanged;

  final bool? obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIconColor: prefixIconColor,
        suffixIconColor: suffixIconColor,
        hintStyle: hintStyle ?? const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
      ),
    );
  }
}
